defmodule Cwms.Inventory.Item do
  use Ecto.Schema
  import Ecto.Changeset
  import Cwms.Inventory.Product, only: [save_unit_price_in_cents: 1]
  alias Cwms.Inventory.Item


  schema "purchase_items" do
    field :description, :string
    field :model_id, :string
    field :name, :string
    field :quantity_requested, :integer
    field :quantity_units, :string
    field :unit_price, :float, virtual: true
    field :unit_price_cents, :integer

    belongs_to :purchase, Cwms.Inventory.Purchase

    timestamps()
  end

  @doc false
  def changeset(%Item{} = item, attrs) do
    item
    |> cast(attrs, [:model_id, :description, :unit_price, :quantity_requested, :quantity_units])
    |> save_unit_price_in_cents
  end
end
