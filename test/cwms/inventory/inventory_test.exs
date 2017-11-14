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

  describe "purchases" do
    alias Cwms.Inventory.Purchase

    @valid_attrs %{address: "some address", person_in_charge: "some person_in_charge", phone: "some phone"}
    @update_attrs %{address: "some updated address", person_in_charge: "some updated person_in_charge", phone: "some updated phone"}
    @invalid_attrs %{address: nil, person_in_charge: nil, phone: nil}

    def purchase_fixture(attrs \\ %{}) do
      {:ok, purchase} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Inventory.create_purchase()

      purchase
    end

    test "list_purchases/0 returns all purchases" do
      purchase = purchase_fixture()
      assert Inventory.list_purchases() == [purchase]
    end

    test "get_purchase!/1 returns the purchase with given id" do
      purchase = purchase_fixture()
      assert Inventory.get_purchase!(purchase.id) == purchase
    end

    test "create_purchase/1 with valid data creates a purchase" do
      assert {:ok, %Purchase{} = purchase} = Inventory.create_purchase(@valid_attrs)
      assert purchase.address == "some address"
      assert purchase.person_in_charge == "some person_in_charge"
      assert purchase.phone == "some phone"
    end

    test "create_purchase/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventory.create_purchase(@invalid_attrs)
    end

    test "update_purchase/2 with valid data updates the purchase" do
      purchase = purchase_fixture()
      assert {:ok, purchase} = Inventory.update_purchase(purchase, @update_attrs)
      assert %Purchase{} = purchase
      assert purchase.address == "some updated address"
      assert purchase.person_in_charge == "some updated person_in_charge"
      assert purchase.phone == "some updated phone"
    end

    test "update_purchase/2 with invalid data returns error changeset" do
      purchase = purchase_fixture()
      assert {:error, %Ecto.Changeset{}} = Inventory.update_purchase(purchase, @invalid_attrs)
      assert purchase == Inventory.get_purchase!(purchase.id)
    end

    test "delete_purchase/1 deletes the purchase" do
      purchase = purchase_fixture()
      assert {:ok, %Purchase{}} = Inventory.delete_purchase(purchase)
      assert_raise Ecto.NoResultsError, fn -> Inventory.get_purchase!(purchase.id) end
    end

    test "change_purchase/1 returns a purchase changeset" do
      purchase = purchase_fixture()
      assert %Ecto.Changeset{} = Inventory.change_purchase(purchase)
    end
  end

  describe "items" do
    alias Cwms.Inventory.Item

    @valid_attrs %{description: "some description", model_id: "some model_id", quantity_requested: 42, quantity_units: "some quantity_units", unit_price: 120.5}
    @update_attrs %{description: "some updated description", model_id: "some updated model_id", quantity_requested: 43, quantity_units: "some updated quantity_units", unit_price: 456.7}
    @invalid_attrs %{description: nil, model_id: nil, quantity_requested: nil, quantity_units: nil, unit_price: nil}

    def item_fixture(attrs \\ %{}) do
      {:ok, item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Inventory.create_item()

      item
    end

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert Inventory.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Inventory.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      assert {:ok, %Item{} = item} = Inventory.create_item(@valid_attrs)
      assert item.description == "some description"
      assert item.model_id == "some model_id"
      assert item.quantity_requested == 42
      assert item.quantity_units == "some quantity_units"
      assert item.unit_price == 120.5
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventory.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      assert {:ok, item} = Inventory.update_item(item, @update_attrs)
      assert %Item{} = item
      assert item.description == "some updated description"
      assert item.model_id == "some updated model_id"
      assert item.quantity_requested == 43
      assert item.quantity_units == "some updated quantity_units"
      assert item.unit_price == 456.7
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Inventory.update_item(item, @invalid_attrs)
      assert item == Inventory.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Inventory.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Inventory.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Inventory.change_item(item)
    end
  end
end
