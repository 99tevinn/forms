defmodule Project.Person do
  @moduledoc """
  The Person context.
  """

  # import Ecto.Query, warn: false
  # alias Project.Repo

  # alias Project.Person.Forms

  # @doc """
  # Returns the list of form.

  # ## Examples

  #     iex> list_form()
  #     [%Forms{}, ...]

  # """
  # def list_form do
  #   Repo.all(Forms)
  # end

  # @doc """
  # Gets a single forms.

  # Raises `Ecto.NoResultsError` if the Forms does not exist.

  # ## Examples

  #     iex> get_forms!(123)
  #     %Forms{}

  #     iex> get_forms!(456)
  #     ** (Ecto.NoResultsError)

  # """
  # def get_forms!(id), do: Repo.get!(Forms, id)

  # @doc """
  # Creates a forms.

  # ## Examples

  #     iex> create_forms(%{field: value})
  #     {:ok, %Forms{}}

  #     iex> create_forms(%{field: bad_value})
  #     {:error, %Ecto.Changeset{}}

  # """
  # def create_forms(attrs \\ %{}) do
  #   %Forms{}
  #   |> Forms.changeset(attrs)
  #   |> Repo.insert()
  # end

  # @doc """
  # Updates a forms.

  # ## Examples

  #     iex> update_forms(forms, %{field: new_value})
  #     {:ok, %Forms{}}

  #     iex> update_forms(forms, %{field: bad_value})
  #     {:error, %Ecto.Changeset{}}

  # """
  # def update_forms(%Forms{} = forms, attrs) do
  #   forms
  #   |> Forms.changeset(attrs)
  #   |> Repo.update()
  # end

  # @doc """
  # Deletes a forms.

  # ## Examples

  #     iex> delete_forms(forms)
  #     {:ok, %Forms{}}

  #     iex> delete_forms(forms)
  #     {:error, %Ecto.Changeset{}}

  # """
  # def delete_forms(%Forms{} = forms) do
  #   Repo.delete(forms)
  # end

  # @doc """
  # Returns an `%Ecto.Changeset{}` for tracking forms changes.

  # ## Examples

  #     iex> change_forms(forms)
  #     %Ecto.Changeset{data: %Forms{}}

  # """
  # def change_forms(%Forms{} = forms, attrs \\ %{}) do
  #   Forms.changeset(forms, attrs)
  # end
end
