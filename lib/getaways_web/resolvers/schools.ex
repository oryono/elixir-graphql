defmodule GetawaysWeb.Resolvers.Schools do
  def schools(_parent, _args, _) do
    {:ok, Getaways.Schools.list_schools()}
  end
end
