defmodule Getaways.Repo.Migrations.CreateSubjects do
  use Ecto.Migration

  def change do
    create table(:subjects) do
      add :title, :string
      add :description, :string

      timestamps()
    end

  end
end
