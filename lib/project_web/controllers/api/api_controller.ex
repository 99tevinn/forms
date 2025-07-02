defmodule ProjectWeb.Api.ApiController do
  use ProjectWeb, :controller

  import Ecto.Changeset
  alias Project.Persons

  def create(conn, %{"form" => form_params}) do
    case Persons.create_user(form_params) do
       {:ok, form} -> json(conn, %{status: "ok", form: form})
       {:error, %Ecto.Changeset{} = changeset} ->
        errors = traverse_errors(changeset, fn {msg, _opts} -> msg end)

        conn
        |> put_status(:unprocessable_entity)
        |> json(%{status: "error", errors: errors})
    end
  end

end
