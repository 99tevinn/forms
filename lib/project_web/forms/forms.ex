defmodule ProjectWeb.Forms.Forms do
  alias Project.Persons

  use ProjectWeb, :live_view

  import Ecto.Changeset

  def mount(_params, _session, socket) do
    {:ok, assign(socket, changeset: person_form(%{}) |> IO.inspect())}
  end

  def handle_params(params, _uri, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end
  
  def apply_action(socket, :add_person, _params) do
    changeset = socket.assigns.changeset
    assign_form(socket, changeset, "add-person")
  end

  def handle_event("create-user", params, socket) do
    new_params = params |> Jason.encode!() |> Jason.decode!()
    {:ok, person} = Persons.create_user(new_params)

   {:noreply, assign(socket, person: person)
    |> put_flash(:info, "User added Successfully")
    |> push_navigate(to: ~p(/add-person))}
  end

  def handle_event("Validate-user", _params, socket) do
    {:noreply, socket}
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset, form_name) do
    form = to_form(changeset, as: form_name)

    if changeset.valid? do
      assign(socket, form: form, check_errors: false, changeset: changeset)
    else
      assign(socket, form: form, changeset: changeset)
    end
  end

  def person_form(params) do
    %Project.Person.Forms{}
    |> Project.Person.Forms.changeset(params)
    |> Map.put(:action, :validate)
  end
end
