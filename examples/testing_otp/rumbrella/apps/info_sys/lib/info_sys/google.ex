#---
# Excerpted from "Programming Phoenix",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/phoenix for more book information.
#---
defmodule InfoSys.Google do
  use GenServer
  alias InfoSys.Result

  def start_link(query, query_ref, owner, limit) do
    Task.start_link(fn -> fetch(query, query_ref, owner, limit) end)
  end

  def fetch("search " <> str, query_ref, owner, _limit) do
    url = "https://www.google.com/#q=#{URI.encode_www_form(str)}"
    results = [
      %Result{backend: "google", url: url, score: 90, text: "links about #{str}"}
    ]
    send(owner, {:results, query_ref, results})
  end
  def fetch(_query, query_ref, owner, _limit) do
    send(owner, {:results, query_ref, []})
  end
end
