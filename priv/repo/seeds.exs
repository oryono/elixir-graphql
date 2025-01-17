# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Getaways.Repo.insert!(%Getaways.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Getaways.Repo
alias Getaways.Vacation.Place
alias Getaways.Accounts.User
alias Getaways.Schools.School
alias Getaways.Subjects.Subject

places = [
  %Place{
    name: "Sand Castle",
    location: "Portugal",
    max_guests: 2
  },
  %Place{
    name: "Blue Igloo",
    location: "Canada",
    max_guests: 4
  },
  %Place{
    name: "Ski Cabin",
    location: "Switzerland",
    max_guests: 6
  }
]

users = [
  %User{
    name: "Patrick Oryono",
    email: "patricken08@gmail.com",
    password: Comeonin.Bcrypt.hashpwsalt("password")
  },
  %User{
    name: "Scovia Akwii",
    email: "scovia@home.com",
    password: Comeonin.Bcrypt.hashpwsalt("password")
  },
  %User{
    name: "Patricia Awilli",
    email: "patricia@home.com",
    password: Comeonin.Bcrypt.hashpwsalt("password")
  }
]

schools = [
  %School{
    name: "St Mary's College Kisubi",
    address: nil
  },
  %School{
    name: "Gayaza High School",
    address: nil
  },
  %School{
    name: "Namilyango College School",
    address: nil
  }
]

subjects = [
  %Subject{
    title: "Physics",
    description: nil
  },
  %Subject{
    title: "Chemistry",
    description: nil
  },
  %Subject{
    title: "Mathematics",
    description: nil
  },
  %Subject{
    title: "English",
    description: nil
  },
  %Subject{
    title: "Geography",
    description: nil
  },
  %Subject{
    title: "History",
    description: nil
  }
]

Enum.each(places, fn place -> Repo.insert!(place) end)
Enum.each(users, fn user -> Repo.insert!(user) end)
Enum.each(schools, fn school -> Repo.insert!(school) end)
Enum.each(subjects, fn subject -> Repo.insert!(subject) end)
