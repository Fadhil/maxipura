defmodule CwmsWeb.PurchaseControllerTest do
  use CwmsWeb.ConnCase

  alias Cwms.Inventory

  @create_attrs %{address: "some address", person_in_charge: "some person_in_charge", phone: "some phone"}
  @update_attrs %{address: "some updated address", person_in_charge: "some updated person_in_charge", phone: "some updated phone"}
  @invalid_attrs %{address: nil, person_in_charge: nil, phone: nil}

  def fixture(:purchase) do
    {:ok, purchase} = Inventory.create_purchase(@create_attrs)
    purchase
  end

  describe "index" do
    test "lists all purchases", %{conn: conn} do
      conn = get conn, purchase_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Purchases"
    end
  end

  describe "new purchase" do
    test "renders form", %{conn: conn} do
      conn = get conn, purchase_path(conn, :new)
      assert html_response(conn, 200) =~ "New Purchase"
    end
  end

  describe "create purchase" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, purchase_path(conn, :create), purchase: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == purchase_path(conn, :show, id)

      conn = get conn, purchase_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Purchase"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, purchase_path(conn, :create), purchase: @invalid_attrs
      assert html_response(conn, 200) =~ "New Purchase"
    end
  end

  describe "edit purchase" do
    setup [:create_purchase]

    test "renders form for editing chosen purchase", %{conn: conn, purchase: purchase} do
      conn = get conn, purchase_path(conn, :edit, purchase)
      assert html_response(conn, 200) =~ "Edit Purchase"
    end
  end

  describe "update purchase" do
    setup [:create_purchase]

    test "redirects when data is valid", %{conn: conn, purchase: purchase} do
      conn = put conn, purchase_path(conn, :update, purchase), purchase: @update_attrs
      assert redirected_to(conn) == purchase_path(conn, :show, purchase)

      conn = get conn, purchase_path(conn, :show, purchase)
      assert html_response(conn, 200) =~ "some updated address"
    end

    test "renders errors when data is invalid", %{conn: conn, purchase: purchase} do
      conn = put conn, purchase_path(conn, :update, purchase), purchase: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Purchase"
    end
  end

  describe "delete purchase" do
    setup [:create_purchase]

    test "deletes chosen purchase", %{conn: conn, purchase: purchase} do
      conn = delete conn, purchase_path(conn, :delete, purchase)
      assert redirected_to(conn) == purchase_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, purchase_path(conn, :show, purchase)
      end
    end
  end

  defp create_purchase(_) do
    purchase = fixture(:purchase)
    {:ok, purchase: purchase}
  end
end
