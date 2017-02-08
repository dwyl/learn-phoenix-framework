#---
# Excerpted from "Programming Phoenix",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/phoenix for more book information.
#---
defmodule InfoSys.Wolfram do
  import SweetXml
  alias InfoSys.Result

  def start_link(query, query_ref, owner, limit) do
    Task.start_link(__MODULE__, :fetch, [query, query_ref, owner, limit])
  end

  def fetch(query_str, query_ref, owner, _limit) do
    query_str
    |> fetch_xml()
    |> xpath(~x"/queryresult/pod[contains(@title, 'Result') or
                                 contains(@title, 'Definitions')]
                            /subpod/plaintext/text()")
    |> send_results(query_ref, owner)
  end

  defp send_results(nil, query_ref, owner) do
    send(owner, {:results, query_ref, []})
  end
  defp send_results(answer, query_ref, owner) do
    results = [%Result{backend: "wolfram", score: 95, text: to_string(answer)}]
    send(owner, {:results, query_ref, results})
  end

  defp fetch_xml(query_str) do
    {:ok, {_, _, body}} = :httpc.request(
      String.to_char_list("http://api.wolframalpha.com/v2/query" <>
        "?appid=#{app_id()}" <>
        "&input=#{URI.encode_www_form(query_str)}&format=plaintext"))
    body
  end

  defp app_id, do: Application.get_env(:info_sys, :wolfram)[:app_id]
end
