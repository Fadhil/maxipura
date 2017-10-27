defmodule CwmsWeb.WorkorderControllerTest do
  use CwmsWeb.ConnCase

  alias Cwms.Workorders

  @create_attrs %{cost: 120.5, date_start: ~D[2010-04-17], details: "some details", duration: 42, status: "some status", title: "some title"}
  @update_attrs %{cost: 456.7, date_start: ~D[2011-05-18], details: "some updated details", duration: 43, status: "some updated status", title: "some updated title"}
  @invalid_attrs %{cost: nil, date_start: nil, details: nil, duration: nil, status: nil, title: nil}

  def fixture(:workorder) do
    {:ok, workorder} = Workorders.create_workorder(@create_attrs)
    workorder
  end

  describe "index" do
    test "lists all workorders", %{conn: conn} do
      conn = get conn, workorder_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Workorders"
    end
  end

  describe "new workorder" do
    test "renders form", %{conn: conn} do
      conn = get conn, workorder_path(conn, :new)
      assert html_response(conn, 200) =~ "New Workorder"
    end
  end

  describe "create workorder" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, workorder_path(conn, :create), workorder: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == workorder_path(conn, :show, id)

      conn = get conn, workorder_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Workorder"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, workorder_path(conn, :create), workorder: @invalid_attrs
      assert html_response(conn, 200) =~ "New Workorder"
    end
  end

  describe "edit workorder" do
    setup [:create_workorder]

    test "renders form for editing chosen workorder", %{conn: conn, workorder: workorder} do
      conn = get conn, workorder_path(conn, :edit, workorder)
      assert html_response(conn, 200) =~ "Edit Workorder"
    end
  end

  describe "update workorder" do
    setup [:create_workorder]

    test "redirects when data is valid", %{conn: conn, workorder: workorder} do
      conn = put conn, workorder_path(conn, :update, workorder), workorder: @update_attrs
      assert redirected_to(conn) == workorder_path(conn, :show, workorder)

      conn = get conn, workorder_path(conn, :show, workorder)
      assert html_response(conn, 200) =~ "some updated details"
    end

    test "renders errors when data is invalid", %{conn: conn, workorder: workorder} do
      conn = put conn, workorder_path(conn, :update, workorder), workorder: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Workorder"
    end
  end

  describe "delete workorder" do
    setup [:create_workorder]

    test "deletes chosen workorder", %{conn: conn, workorder: workorder} do
      conn = delete conn, workorder_path(conn, :delete, workorder)
      assert redirected_to(conn) == workorder_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, workorder_path(conn, :show, workorder)
      end
    end
  end

  defp create_workorder(_) do
    workorder = fixture(:workorder)
    {:ok, workorder: workorder}
  end
end
