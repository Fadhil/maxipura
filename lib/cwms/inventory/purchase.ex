defmodule Cwms.Inventory.Purchase do
  use Ecto.Schema
  import Ecto.Changeset
  alias Cwms.Inventory.Purchase
  alias Cwms.Repo


  schema "purchases" do
    field :address, :string
    # field :person_in_charge, :string
    field :phone, :string
    field :status, :string

    belongs_to :person_in_charge, Cwms.User, foreign_key: :pic_id
    belongs_to :requester, Cwms.User

    timestamps()
  end

  @doc false
  def changeset(%Purchase{} = purchase, attrs) do
    purchase
    |> Repo.preload([:person_in_charge, :requester])
    |> cast(attrs, [:address, :phone, :pic_id, :requester_id])
    |> validate_required([:address, :phone])
    |> cast_assoc(:person_in_charge)
    |> cast_assoc(:requester)
  end

  def new_changeset(%Purchase{} = purchase, attrs) do
    purchase
    |> changeset(attrs)
    |> set_status("new")
  end

  defp set_status(changeset, status) do
    changeset
    |> put_change(:status, status)
  end
end
