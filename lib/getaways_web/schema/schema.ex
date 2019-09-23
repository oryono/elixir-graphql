defmodule GetawaysWeb.Schema.Schema do
  use Absinthe.Schema

  query do
    @desc "Get a list of places"
    field :places, list_of(:place) do
      resolve(&GetawaysWeb.Resolvers.Vacation.places/3)
    end

    @desc "Get a place by its id"
    field :place, :place do
      arg(:id, non_null(:id))
      resolve(&GetawaysWeb.Resolvers.Vacation.place/3)
    end

    @desc "Get a list of users"
    field :users, list_of(:user) do
      resolve(&GetawaysWeb.Resolvers.Accounts.users/3)
    end

    @desc "Get a list of schools"
    field :schools, list_of(:school) do
      resolve(&GetawaysWeb.Resolvers.Schools.schools/3)
    end

     @desc "Get a list of subjects"
    field :subjects, list_of(:subject) do
      resolve(&GetawaysWeb.Resolvers.Subjects.subjects/3)
    end
  end

  mutation do
    field :signup, :token do
      arg(:name, non_null(:string))
      arg(:email, non_null(:string))
      arg(:plain_password, non_null(:string))
      resolve(&GetawaysWeb.Resolvers.Accounts.signup/3)
    end

    field :login, :token do
      arg(:email, non_null(:string))
      arg(:password, non_null(:string))
      resolve(&GetawaysWeb.Resolvers.Accounts.login/3)
    end
  end

  object :place do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :location, non_null(:string)
    field :max_guests, non_null(:integer)
  end

  object :user do
    field :id, non_null(:id)
    field :email, non_null(:string)
    field :name, non_null(:string)
  end

  object :school do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :slug, :string
    field :address, :string
  end

  object :subject do
    field :id, non_null(:id)
    field :title, non_null(:string)
    field :title, :string
  end

  object :token do
    field :token, non_null(:string)
  end
end
