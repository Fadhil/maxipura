defmodule CwmsWeb.InventoryControllerTest do
  use CwmsWeb.ConnCase

  alias Cwms.Inventories

  @create_attrs %{name: "some name", price: 120.5, quantity_stock: 42}
  @update_attrs %{name: "some updated name", price: 456.7, quantity_stock: 43}
  @invalid_attrs %{name: nil, price: nil, quantity_stock: nil}

  def fixture(:inventory) do
    {:ok, inventory} = Inventories.create_inventory(@create_attrs)
    inventory
  end

  describe "index" do
    test "lists all inventories", %{conn: conn} do
      conn = get conn, product_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Inventories"
    end
  end

  describe "new inventory" do
    test "renders form", %{conn: conn} do
      conn = get conn, product_path(conn, :new)
      assert html_response(conn, 200) =~ "New Inventory"
    end
  end

  describe "create inventory" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, product_path(conn, :create), inventory: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == product_path(conn, :show, id)

      conn = get conn, product_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Inventory"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, product_path(conn, :create), inventory: @invalid_attrs
      assert html_response(conn, 200) =~ "New Inventory"
    end
  end

  describe "edit inventory" do
    setup [:create_inventory]

    test "renders form for editing chosen inventory", %{conn: conn, inventory: inventory} do
      conn = get conn, product_path(conn, :edit, inventory)
      assert html_response(conn, 200) =~ "Edit Inventory"
    end
  end

  describe "update inventory" do
    setup [:create_inventory]

    test "redirects when data is valid", %{conn: conn, inventory: inventory} do
      conn = put conn, product_path(conn, :update, inventory), inventory: @update_attrs
      assert redirected_to(conn) == product_path(conn, :show, inventory)

      conn = get conn, product_path(conn, :show, inventory)
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, inventory: inventory} do
      conn = put conn, product_path(conn, :update, inventory), inventory: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Inventory"
    end
  end

  describe "delete inventory" do
    setup [:create_inventory]

    test "deletes chosen inventory", %{conn: conn, inventory: inventory} do
      conn = delete conn, product_path(conn, :delete, inventory)
      assert redirected_to(conn) == product_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, product_path(conn, :show, inventory)
      end
    end
  end

  defp create_inventory(_) do
    inventory = fixture(:inventory)
    {:ok, inventory: inventory}
  end
end
