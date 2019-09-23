defmodule Getaways.Subjects.Subject do
  use Ecto.Schema
  import Ecto.Changeset

  schema "subjects" do
    field :description, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(subject, attrs) do
    subject
    |> cast(attrs, [:title, :description])
    |> validate_required([:title, :description])
  end
end
