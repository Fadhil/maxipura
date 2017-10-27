defmodule Cwms.Repo.Migrations.CreateWorkorders do
  use Ecto.Migration

  def change do
    create table(:workorders) do
      add :title, :string
      add :details, :text
      add :cost, :float
      add :date_start, :date
      add :duration, :integer
      add :status, :string
      add :vehicle_id, references(:vehicles, on_delete: :nothing)

      timestamps()
    end

    create index(:workorders, [:vehicle_id])
  end
end
