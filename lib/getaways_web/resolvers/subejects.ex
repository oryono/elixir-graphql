defmodule GetawaysWeb.Resolvers.Subjects do
  def subjects(_parent, _args, _) do
    {:ok, Getaways.Subjects.list_subjects()}
  end
end
