defmodule Cwms.Repo.Migrations.AddPurchasesReferenceToItems do
  use Ecto.Migration

  def change do
    alter table(:purchase_items) do
      add :purchase_id, references(:purchases)
    end
  end
end
