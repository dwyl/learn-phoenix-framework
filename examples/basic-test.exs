# run this test using the following command:
# elixir -e "ExUnit.start()" -r basic-test.exs

defmodule MyTest do
  use ExUnit.Case, async: true

  setup do
    # run some tedious setup code
    :ok
  end

  test "pass" do
    assert true
  end

  test "fail" do
    refute false
  end
end


# thanks to @shouston3 in
# https://github.com/dwyl/learn-phoenix-framework/issues/34#issuecomment-280930167