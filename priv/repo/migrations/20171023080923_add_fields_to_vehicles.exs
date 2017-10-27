defmodule Cwms.Repo.Migrations.AddFieldsToVehicles do
  use Ecto.Migration

  def change do
    alter table(:vehicles) do
      add :color, :string
      add :model, :string
    end
  end
end
