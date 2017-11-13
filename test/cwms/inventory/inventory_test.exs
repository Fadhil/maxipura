defmodule Cwms.InventoryTest do
  use Cwms.DataCase

  alias Cwms.Inventory

  describe "products" do
    alias Cwms.Inventory.Product

    @valid_attrs %{model_id: "some model_id", name: "some name", quantity: 42, unit_price: 120.5, unit_price_cents: 42}
    @update_attrs %{model_id: "some updated model_id", name: "some updated name", quantity: 43, unit_price: 456.7, unit_price_cents: 43}
    @invalid_attrs %{model_id: nil, name: nil, quantity: nil, unit_price: nil, unit_price_cents: nil}

    def product_fixture(attrs \\ %{}) do
      {:ok, product} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Inventory.create_product()

      product
    end

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Inventory.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Inventory.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      assert {:ok, %Product{} = product} = Inventory.create_product(@valid_attrs)
      assert product.model_id == "some model_id"
      assert product.name == "some name"
      assert product.quantity == 42
      assert product.unit_price == 120.5
      assert product.unit_price_cents == 42
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventory.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      assert {:ok, product} = Inventory.update_product(product, @update_attrs)
      assert %Product{} = product
      assert product.model_id == "some updated model_id"
      assert product.name == "some updated name"
      assert product.quantity == 43
      assert product.unit_price == 456.7
      assert product.unit_price_cents == 43
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Inventory.update_product(product, @invalid_attrs)
      assert product == Inventory.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Inventory.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Inventory.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Inventory.change_product(product)
    end
  end
end
