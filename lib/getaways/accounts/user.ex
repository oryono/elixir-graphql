defmodule Getaways.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string

    # Virtual fields:
    field :plain_password, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :plain_password])
    |> validate_required([:name, :email, :plain_password])
    |> unique_constraint(:email)
    |> put_password_hash
  end

  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{plain_password: plain_password}} ->
        put_change(changeset, :password, Comeonin.Bcrypt.hashpwsalt(plain_password))

      _ ->
        changeset
    end
  end
end
