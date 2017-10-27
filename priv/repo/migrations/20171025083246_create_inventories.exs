defmodule Cwms.Repo.Migrations.CreateInventories do
  use Ecto.Migration

  def change do
    create table(:inventories) do
      add :name, :string
      add :quantity_stock, :integer
      add :price, :float

      timestamps()
    end

  end
end
