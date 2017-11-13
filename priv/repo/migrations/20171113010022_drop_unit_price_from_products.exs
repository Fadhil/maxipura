defmodule Cwms.Repo.Migrations.DropUnitPriceFromProducts do
  use Ecto.Migration

  def up do
    alter table(:products) do
      remove :unit_price
    end
  end

  def down do
    alter table(:products) do
      add :unit_price, :float
    end
  end
end
