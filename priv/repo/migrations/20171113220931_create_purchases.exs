defmodule Cwms.Repo.Migrations.CreatePurchases do
  use Ecto.Migration

  def change do
    create table(:purchases) do
      add :address, :string
      add :phone,   :string
      add :person_in_charge, :string

      timestamps
    end
  end
end
