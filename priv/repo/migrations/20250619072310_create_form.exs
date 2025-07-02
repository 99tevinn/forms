defmodule Project.Repo.Migrations.CreateForm do
  use Ecto.Migration

  def change do
    create table(:form) do
      add :name, :string
      add :email, :string
      add :age, :integer

      timestamps()
    end
  end
end
