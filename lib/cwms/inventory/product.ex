defmodule Cwms.Inventory.Product do
  use Ecto.Schema
  import Ecto.Changeset
  alias Cwms.Inventory.Product


  schema "products" do
    field :model_id, :string
    field :name, :string
    field :quantity, :integer
    field :unit_price, :float, virtual: true
    field :unit_price_cents, :integer

    timestamps()
  end

  @doc false
  def changeset(%Product{} = product, attrs) do
    product
    |> cast(attrs, [:name, :model_id, :quantity, :unit_price])
    |> validate_required([:name, :model_id, :quantity, :unit_price])
    |> save_unit_price_in_cents()
  end

  def save_unit_price_in_cents(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{unit_price: price}} ->
        put_change(changeset, :unit_price_cents, price_in_cents(price))
      _->
        changeset
    end
  end

  def price_in_cents(price) when is_float(price) do
    (price * 100)
    |> round
  end
end
