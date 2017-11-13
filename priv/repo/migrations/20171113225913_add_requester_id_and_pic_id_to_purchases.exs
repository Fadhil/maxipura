defmodule Cwms.Repo.Migrations.AddRequesterIdAndPicIdToPurchases do
  use Ecto.Migration

  def change do
    alter table(:purchases) do
      add :requester_id, references(:users)
      add :pic_id, references(:users)
    end
  end
end
