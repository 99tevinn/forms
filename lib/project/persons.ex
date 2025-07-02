defmodule Project.Persons do
  alias Project.{Repo, Person, Person.Forms}

  def list_person() do
    Repo.all(Person)
  end

  def create_user(params) do
    Project.Person.Forms.changeset(%Forms{}, params) |> Repo.insert()
  end
end
