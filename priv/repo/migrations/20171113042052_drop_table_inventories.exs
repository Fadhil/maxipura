defmodule Cwms.Repo.Migrations.DropTableInventories do
  use Ecto.Migration

  def up do
    drop table(:inventories)
  end

  def down do
    create table(:inventories) do
      add :name, :string
      add :quantity_stock, :integer
      add :price, :float

      timestamps()
    end
  end
end
