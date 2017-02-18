defmodule Rumbl.Video do
  use Rumbl.Web, :model

  schema "videos" do
    field :url, :string
    field :title, :string
    field :descrcription, :string
    belongs_to :user, Rumbl.User
    belongs_to :category, Rumbl.Category

    timestamps() # invocation parenthesis not in book
  end

  @required_fields ~w(url title descrcription)
  @optional_fields ~w(category_id)

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:url, :title, :descrcription])
    |> validate_required([:url, :title, :descrcription])
  end
end
