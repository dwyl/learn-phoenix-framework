defmodule Rumbl.Video do
  use Rumbl.Web, :model

  schema "videos" do
    field :url, :string
    field :title, :string
    field :description, :string
    belongs_to :user, Rumbl.User
    belongs_to :category, Rumbl.Category

    timestamps() # invocation parenthesis not in book
  end

  @required_fields ~w(url title description)
  @optional_fields ~w(category_id)
  @all_fields ~w(url title description category_id)

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields, @optional_fields)
    # |> cast(params, @all_fields) # see: https://github.com/dwyl/learn-phoenix-framework/issues/35
    # |> validate_required(params, @required_fields)
    |> assoc_constraint(:category)
  end
end
