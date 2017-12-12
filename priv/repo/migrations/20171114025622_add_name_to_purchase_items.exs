defmodule Cwms.Repo.Migrations.AddNameToPurchaseItems do
  use Ecto.Migration

  def change do
    alter table(:purchase_items) do
      add :name, :string
    end
  end
end
