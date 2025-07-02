defmodule Project.PersonFixtures do
#   @moduledoc """
#   This module defines test helpers for creating
#   entities via the `Project.Person` context.
#   """

#   @doc """
#   Generate a forms.
#   """
#   def forms_fixture(attrs \\ %{}) do
#     {:ok, forms} =
#       attrs
#       |> Enum.into(%{
#         age: 42,
#         email: "some email",
#         name: "some name"
#       })
#       |> Project.Person.create_forms()

#     forms
#   end
end
