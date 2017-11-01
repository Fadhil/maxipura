defmodule Cwms.Repo.Migrations.ProfileForeign_Key do
  use Ecto.Migration

  def change do
  	alter table(:profiles) do
      add :user_id, references(:users, on_delete: :nothing)
    end
  end
end
