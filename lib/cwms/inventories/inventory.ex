defmodule Cwms.Inventories.Inventory do
  use Ecto.Schema
  import Ecto.Changeset
  alias Cwms.Inventories.Inventory


  schema "inventories" do
    field :name, :string
    field :price, :float
    field :quantity_stock, :integer

    timestamps()
  end

  @doc false
  def changeset(%Inventory{} = inventory, attrs) do
    inventory
    |> cast(attrs, [:name, :quantity_stock, :price])
    |> validate_required([:name, :quantity_stock, :price])
  end
end
