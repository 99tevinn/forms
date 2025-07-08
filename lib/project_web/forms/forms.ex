defmodule ProjectWeb.Forms.Forms do
  alias Project.Persons

  use ProjectWeb, :live_view

  import Ecto.Changeset

  def mount(_params, _session, socket) do
    changeset = Project.Person.Forms.changeset(%Project.Person.Forms{})
    {:ok, assign(socket, changeset: changeset)}
  end

  def handle_params(params, _uri, socket) do
    changeset =
      %Project.Person.Forms{}
      |> Project.Person.Forms.changeset(params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, changeset: changeset)}
  end

  def apply_action(socket, :add_person, _params) do
    changeset = socket.assigns.changeset
    assign_form(socket, changeset, "add-person")
  end

  def handle_event("create-user", params, socket) do
    case Persons.create_user(params) do
      {:ok, person} ->
        {:noreply,
         socket
         |> assign(person: person)
         |> put_flash(:info, "User added Successfully")
         |> push_navigate(to: ~p"/add-person")}

      {:error, changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end

  def handle_event("Validate-user", _params, socket) do
    {:noreply, socket}
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset, form_name) do
    form = to_form(changeset, as: form_name)

    socket
    |> assign(form: form)
    |> assign(:check_errors, !changeset.valid?)
    |> assign(changeset: changeset)
  end
end
