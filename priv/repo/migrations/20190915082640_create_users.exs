defmodule Getaways.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :password, :string
      add :user_type, :integer
      add :school_id, :integer

      timestamps()
    end

  end
end
