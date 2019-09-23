defmodule Getaways.Repo.Migrations.CreateSchools do
  use Ecto.Migration

  def change do
    create table(:schools) do
      add :name, :string
      add :address, :string
      add :slug, :string

      timestamps()
    end

    create unique_index(:schools, [:slug])
  end
end
