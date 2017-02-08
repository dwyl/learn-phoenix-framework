#---
# Excerpted from "Programming Phoenix",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/phoenix for more book information.
#---
defmodule Rumbl.ModelCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias Rumbl.Repo
      import Ecto
      import Ecto.Changeset
      import Ecto.Query, only: [from: 1, from: 2]
      import Rumbl.TestHelpers
      import Rumbl.ModelCase
    end
  end

  setup tags do
    unless tags[:async] do
      Ecto.Adapters.SQL.restart_test_transaction(Rumbl.Repo, [])
    end

    :ok
  end

  @doc """
  Helper for returning list of errors in model when passed certain data.
  """
  def errors_on(model, data) do
    model.__struct__.changeset(model, data).errors
  end
end
