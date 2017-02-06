#---
# Excerpted from "Programming Phoenix",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/phoenix for more book information.
#---
defmodule InfoSysTest do
  use ExUnit.Case
  alias InfoSys.Result

  defmodule TestBackend do 
    def start_link(query, ref, owner, limit) do
      Task.start_link(__MODULE__, :fetch, [query, ref, owner, limit])
    end
    def fetch("result", ref, owner, _limit) do
      send(owner, {:results, ref, [%Result{backend: "test", text: "result"}]})
    end
    def fetch("none", ref, owner, _limit) do
      send(owner, {:results, ref, []})
    end
    def fetch("timeout", _ref, owner, _limit) do 
      send(owner, {:backend, self()})
      :timer.sleep(:infinity)
    end
    def fetch("boom", _ref, _owner, _limit) do 
      raise "boom!"
    end
  end

  @tag :capture_log
  test "compute/2 discards backend errors" do
    assert InfoSys.compute("boom", backends: [TestBackend]) == []
    refute_received {:DOWN, _, _, _, _}
    refute_received :timedout
  end

  test "compute/2 with timeout returns no results and kills workers" do 
    results = InfoSys.compute("timeout", backends: [TestBackend], timeout: 10)
    assert results == []
    assert_receive {:backend, backend_pid} 
    ref = Process.monitor(backend_pid)
    assert_receive {:DOWN, ^ref, :process, _pid, _reason}
    refute_received {:DOWN, _, _, _, _}
    refute_received :timedout
  end

  test "compute/2 with backend results" do 
    assert [%Result{backend: "test", text: "result"}] =
           InfoSys.compute("result", backends: [TestBackend])
  end

  test "compute/2 with no backend results" do 
    assert [] = InfoSys.compute("none", backends: [TestBackend])
  end
end
