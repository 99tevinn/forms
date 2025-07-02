defmodule ProjectWeb.FormsController do
  use ProjectWeb, :controller

  # alias Project.Person
  # alias Project.Person.Forms

  # def index(conn, _params) do
  #   form = Person.list_form()
  #   render(conn, :index, form: form)
  # end

  # def new(conn, _params) do
  #   changeset = Person.change_forms(%Forms{})
  #   render(conn, :new, changeset: changeset)
  # end

  # def create(conn, %{"forms" => forms_params}) do
  #   case Person.create_forms(forms_params) do
  #     {:ok, forms} ->
  #       conn
  #       |> put_flash(:info, "Forms created successfully.")
  #       |> redirect(to: ~p"/form/#{forms}")

  #     {:error, %Ecto.Changeset{} = changeset} ->
  #       render(conn, :new, changeset: changeset)
  #   end
  # end

  # def show(conn, %{"id" => id}) do
  #   forms = Person.get_forms!(id)
  #   render(conn, :show, forms: forms)
  # end

  # def edit(conn, %{"id" => id}) do
  #   forms = Person.get_forms!(id)
  #   changeset = Person.change_forms(forms)
  #   render(conn, :edit, forms: forms, changeset: changeset)
  # end

  # def update(conn, %{"id" => id, "forms" => forms_params}) do
  #   forms = Person.get_forms!(id)

  #   case Person.update_forms(forms, forms_params) do
  #     {:ok, forms} ->
  #       conn
  #       |> put_flash(:info, "Forms updated successfully.")
  #       |> redirect(to: ~p"/form/#{forms}")

  #     {:error, %Ecto.Changeset{} = changeset} ->
  #       render(conn, :edit, forms: forms, changeset: changeset)
  #   end
  # end

  # def delete(conn, %{"id" => id}) do
  #   forms = Person.get_forms!(id)
  #   {:ok, _forms} = Person.delete_forms(forms)

  #   conn
  #   |> put_flash(:info, "Forms deleted successfully.")
  #   |> redirect(to: ~p"/form")
  # end
end
