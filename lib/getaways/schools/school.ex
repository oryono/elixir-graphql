defmodule Getaways.Schools.TitleSlug do
  use EctoAutoslugField.Slug, from: :name, to: :slug
end

defmodule Getaways.Schools.School do
  use Ecto.Schema
  import Ecto.Changeset

  alias Getaways.Schools.TitleSlug

  schema "schools" do
    field :address, :string
    field :name, :string
    field :slug, TitleSlug.Type

    timestamps()
  end

  @doc false
  def changeset(school, attrs) do
    school
    |> cast(attrs, [:name, :address])
    |> validate_required([:name, :address])
    |> unique_constraint(:name)
    |> TitleSlug.maybe_generate_slug()
    |> TitleSlug.unique_constraint()
  end
end
