defmodule Cwms.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:purchase_items) do
      add :model_id, :string
      add :quantity_requested, :integer
      add :quantity_units, :string
      add :unit_price_cents, :integer
      add :description, :string

      timestamps
    end
  end
end
