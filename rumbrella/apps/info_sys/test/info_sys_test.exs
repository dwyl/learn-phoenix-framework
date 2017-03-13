defmodule InfoSysTest do
  use ExUnit.Case
  alias InfoSys.Result

  defmodule TestBackend do
    def start_link(query, ref, owner, limit) do
      Task.start_link(__MODULE__, :fetch, [query, ref, owner, limit])
    end
    def fetch("result", ref, owner, __limit) do
      send(owner, {:results, ref, [%Result{backend: "test", text: "result"}]})
    end
    def fetch("none", ref, owner, __limit) do
      send(owner, {:results, ref, []})
    end
  end

  test "compute/2 with backend results" do
    assert [%Result{backend: "test", text: "result"}] =
      InfoSys.compute("result", backends: [TestBackend])
  end

  test "compute/2 with no backend results" do
    assert [] = InfoSys.compute("none", backends: [TestBackend])
  end
end
