defmodule Cwms.Repo.Migrations.CreateProfiles do
  use Ecto.Migration

  def change do
    create table(:profiles) do
      add :fullname, :string
      add :icno, :string
      add :phone, :string
      add :address, :string

      timestamps()
    end

  end
end
