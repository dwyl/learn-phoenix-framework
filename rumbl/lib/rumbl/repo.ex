defmodule Rumbl.Repo do
  # use Ecto.Repo, otp_app: :rumbl
  @moduledoc """
  In memory repository
  """
  def all(Rumbl.User) do
    [%Rumbl.User{id: 1, name: "José", username: "josevalim", password: "elixir"},
     %Rumbl.User{id: 2, name: "Bruce", username: "redrapids", password: "7langs"},
     %Rumbl.User{id: 3, name: "Chris", username: "chrismccord", password: "phx"}]
  end
  def all(_module), do []
end
