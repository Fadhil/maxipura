defmodule Cwms.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :model_id, :string
      add :quantity, :integer
      add :unit_price, :float
      add :unit_price_cents, :integer

      timestamps()
    end

  end
end
