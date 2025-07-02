defmodule Project.Person.Forms do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:name, :email, :age, :inserted_at, :updated_at]}
  schema "form" do
    field :name, :string
    field :email, :string
    field :age, :integer

    timestamps()
  end

  @doc false
  def changeset(forms, attrs \\ %{}) do
    forms
    |> cast(attrs, [:name, :email, :age])
    |> validate_required([:name, :email, :age])
    |> validate_format(:email, ~r/@/)
  end
end
