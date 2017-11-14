defmodule Cwms.Repo.Migrations.AddStatusToPurchases do
  use Ecto.Migration

  def change do
    alter table(:purchases) do
      add :status, :string
    end
  end
end
