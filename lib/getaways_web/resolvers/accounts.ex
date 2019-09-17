defmodule GetawaysWeb.Resolvers.Accounts do
  alias Getaways.Guardian

  def users(_parent, _args_, _) do
    {:ok, Getaways.Accounts.list_users()}
  end

  def signup(_parent, args, _) do
    case Getaways.Accounts.create_user(args) do
      {:ok, user} ->
        {:ok, token, _claims} = Guardian.encode_and_sign(user)
        {:ok, %{token: token}}

      error ->
        {:error, error}
    end
  end

  def login(_parent, args, _) do
    case Getaways.Accounts.token_sign_in(args) do
      {:ok, token} ->
        {:ok, %{token: token}}

      {:error, :unauthorized} ->
        {:error, "Unauthorised"}

      error ->
        {:error, error}
    end
  end
end
