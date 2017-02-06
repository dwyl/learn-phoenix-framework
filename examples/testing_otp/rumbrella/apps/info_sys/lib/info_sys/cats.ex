#---
# Excerpted from "Programming Phoenix",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/phoenix for more book information.
#---
defmodule InfoSys.Cats do
  use GenServer
  alias InfoSys.Result

  def start_link(query, query_ref, owner, limit) do
    GenServer.start_link(__MODULE__, [owner, query_ref, query, limit])
  end

  def init([owner, query_ref, query, limit]) do
    send(self, :fetch)
    {:ok, %{owner: owner, query_ref: query_ref, query: query, limit: limit}}
  end

  def handle_info(:fetch, state) do
    if String.contains?(state.query, "cat") do
      results = [
        %Result{backend: "cats", score: 100, text: "OMG CATS 🐱"}
      ]
      send(state.owner, {:results, state.query_ref, results})
    end
    {:stop, :normal, state}
  end
end
