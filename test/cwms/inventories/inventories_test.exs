defmodule Cwms.InventoriesTest do
  use Cwms.DataCase

  alias Cwms.Inventories

  describe "inveventories" do
    alias Cwms.Inventories.Inventory

    @valid_attrs %{name: "some name", price: 120.5, quantity_stock: 42}
    @update_attrs %{name: "some updated name", price: 456.7, quantity_stock: 43}
    @invalid_attrs %{name: nil, price: nil, quantity_stock: nil}

    def inventory_fixture(attrs \\ %{}) do
      {:ok, inventory} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Inventories.create_inventory()

      inventory
    end

    test "list_inveventories/0 returns all inveventories" do
      inventory = inventory_fixture()
      assert Inventories.list_inveventories() == [inventory]
    end

    test "get_inventory!/1 returns the inventory with given id" do
      inventory = inventory_fixture()
      assert Inventories.get_inventory!(inventory.id) == inventory
    end

    test "create_inventory/1 with valid data creates a inventory" do
      assert {:ok, %Inventory{} = inventory} = Inventories.create_inventory(@valid_attrs)
      assert inventory.name == "some name"
      assert inventory.price == 120.5
      assert inventory.quantity_stock == 42
    end

    test "create_inventory/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventories.create_inventory(@invalid_attrs)
    end

    test "update_inventory/2 with valid data updates the inventory" do
      inventory = inventory_fixture()
      assert {:ok, inventory} = Inventories.update_inventory(inventory, @update_attrs)
      assert %Inventory{} = inventory
      assert inventory.name == "some updated name"
      assert inventory.price == 456.7
      assert inventory.quantity_stock == 43
    end

    test "update_inventory/2 with invalid data returns error changeset" do
      inventory = inventory_fixture()
      assert {:error, %Ecto.Changeset{}} = Inventories.update_inventory(inventory, @invalid_attrs)
      assert inventory == Inventories.get_inventory!(inventory.id)
    end

    test "delete_inventory/1 deletes the inventory" do
      inventory = inventory_fixture()
      assert {:ok, %Inventory{}} = Inventories.delete_inventory(inventory)
      assert_raise Ecto.NoResultsError, fn -> Inventories.get_inventory!(inventory.id) end
    end

    test "change_inventory/1 returns a inventory changeset" do
      inventory = inventory_fixture()
      assert %Ecto.Changeset{} = Inventories.change_inventory(inventory)
    end
  end

  describe "inventories" do
    alias Cwms.Inventories.Inventory

    @valid_attrs %{name: "some name", price: 120.5, quantity_stock: 42}
    @update_attrs %{name: "some updated name", price: 456.7, quantity_stock: 43}
    @invalid_attrs %{name: nil, price: nil, quantity_stock: nil}

    def inventory_fixture(attrs \\ %{}) do
      {:ok, inventory} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Inventories.create_inventory()

      inventory
    end

    test "list_inventories/0 returns all inventories" do
      inventory = inventory_fixture()
      assert Inventories.list_inventories() == [inventory]
    end

    test "get_inventory!/1 returns the inventory with given id" do
      inventory = inventory_fixture()
      assert Inventories.get_inventory!(inventory.id) == inventory
    end

    test "create_inventory/1 with valid data creates a inventory" do
      assert {:ok, %Inventory{} = inventory} = Inventories.create_inventory(@valid_attrs)
      assert inventory.name == "some name"
      assert inventory.price == 120.5
      assert inventory.quantity_stock == 42
    end

    test "create_inventory/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventories.create_inventory(@invalid_attrs)
    end

    test "update_inventory/2 with valid data updates the inventory" do
      inventory = inventory_fixture()
      assert {:ok, inventory} = Inventories.update_inventory(inventory, @update_attrs)
      assert %Inventory{} = inventory
      assert inventory.name == "some updated name"
      assert inventory.price == 456.7
      assert inventory.quantity_stock == 43
    end

    test "update_inventory/2 with invalid data returns error changeset" do
      inventory = inventory_fixture()
      assert {:error, %Ecto.Changeset{}} = Inventories.update_inventory(inventory, @invalid_attrs)
      assert inventory == Inventories.get_inventory!(inventory.id)
    end

    test "delete_inventory/1 deletes the inventory" do
      inventory = inventory_fixture()
      assert {:ok, %Inventory{}} = Inventories.delete_inventory(inventory)
      assert_raise Ecto.NoResultsError, fn -> Inventories.get_inventory!(inventory.id) end
    end

    test "change_inventory/1 returns a inventory changeset" do
      inventory = inventory_fixture()
      assert %Ecto.Changeset{} = Inventories.change_inventory(inventory)
    end
  end
end
