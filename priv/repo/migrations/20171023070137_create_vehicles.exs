defmodule Cwms.Repo.Migrations.CreateVehicles do
  use Ecto.Migration

  def change do
    create table(:vehicles) do
      add :no_plate, :string
      add :type, :string
      add :issue, :text
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:vehicles, [:user_id])
  end
end
