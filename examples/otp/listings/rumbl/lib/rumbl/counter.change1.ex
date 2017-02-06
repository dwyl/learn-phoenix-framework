#---
# Excerpted from "Programming Phoenix",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/phoenix for more book information.
#---
defmodule Rumbl.Counter do
  use GenServer

  def inc(pid), do: GenServer.cast(pid, :inc) 

  def dec(pid), do: GenServer.cast(pid, :dec) 

  def val(pid) do 
    GenServer.call(pid, :val)
  end

  def start_link(initial_val) do
    GenServer.start_link(__MODULE__, initial_val) 
  end

  def init(initial_val) do 
    {:ok, initial_val}
  end

  def handle_cast(:inc, val) do 
    {:noreply, val + 1}
  end

  def handle_cast(:dec, val) do 
    {:noreply, val - 1}
  end

  def handle_call(:val, _from, val) do 
    {:reply, val, val}
  end
end
