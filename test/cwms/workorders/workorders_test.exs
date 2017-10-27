defmodule Cwms.WorkordersTest do
  use Cwms.DataCase

  alias Cwms.Workorders

  describe "workorders" do
    alias Cwms.Workorders.Workorder

    @valid_attrs %{cost: 42, date_start: ~D[2010-04-17], details: "some details", duration: 42, status: "some status", title: "some title"}
    @update_attrs %{cost: 43, date_start: ~D[2011-05-18], details: "some updated details", duration: 43, status: "some updated status", title: "some updated title"}
    @invalid_attrs %{cost: nil, date_start: nil, details: nil, duration: nil, status: nil, title: nil}

    def workorder_fixture(attrs \\ %{}) do
      {:ok, workorder} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Workorders.create_workorder()

      workorder
    end

    test "list_workorders/0 returns all workorders" do
      workorder = workorder_fixture()
      assert Workorders.list_workorders() == [workorder]
    end

    test "get_workorder!/1 returns the workorder with given id" do
      workorder = workorder_fixture()
      assert Workorders.get_workorder!(workorder.id) == workorder
    end

    test "create_workorder/1 with valid data creates a workorder" do
      assert {:ok, %Workorder{} = workorder} = Workorders.create_workorder(@valid_attrs)
      assert workorder.cost == 42
      assert workorder.date_start == ~D[2010-04-17]
      assert workorder.details == "some details"
      assert workorder.duration == 42
      assert workorder.status == "some status"
      assert workorder.title == "some title"
    end

    test "create_workorder/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Workorders.create_workorder(@invalid_attrs)
    end

    test "update_workorder/2 with valid data updates the workorder" do
      workorder = workorder_fixture()
      assert {:ok, workorder} = Workorders.update_workorder(workorder, @update_attrs)
      assert %Workorder{} = workorder
      assert workorder.cost == 43
      assert workorder.date_start == ~D[2011-05-18]
      assert workorder.details == "some updated details"
      assert workorder.duration == 43
      assert workorder.status == "some updated status"
      assert workorder.title == "some updated title"
    end

    test "update_workorder/2 with invalid data returns error changeset" do
      workorder = workorder_fixture()
      assert {:error, %Ecto.Changeset{}} = Workorders.update_workorder(workorder, @invalid_attrs)
      assert workorder == Workorders.get_workorder!(workorder.id)
    end

    test "delete_workorder/1 deletes the workorder" do
      workorder = workorder_fixture()
      assert {:ok, %Workorder{}} = Workorders.delete_workorder(workorder)
      assert_raise Ecto.NoResultsError, fn -> Workorders.get_workorder!(workorder.id) end
    end

    test "change_workorder/1 returns a workorder changeset" do
      workorder = workorder_fixture()
      assert %Ecto.Changeset{} = Workorders.change_workorder(workorder)
    end
  end

  describe "workorders" do
    alias Cwms.Workorders.Workorder

    @valid_attrs %{cost: 120.5, date_start: ~D[2010-04-17], details: "some details", duration: 42, status: "some status", title: "some title"}
    @update_attrs %{cost: 456.7, date_start: ~D[2011-05-18], details: "some updated details", duration: 43, status: "some updated status", title: "some updated title"}
    @invalid_attrs %{cost: nil, date_start: nil, details: nil, duration: nil, status: nil, title: nil}

    def workorder_fixture(attrs \\ %{}) do
      {:ok, workorder} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Workorders.create_workorder()

      workorder
    end

    test "list_workorders/0 returns all workorders" do
      workorder = workorder_fixture()
      assert Workorders.list_workorders() == [workorder]
    end

    test "get_workorder!/1 returns the workorder with given id" do
      workorder = workorder_fixture()
      assert Workorders.get_workorder!(workorder.id) == workorder
    end

    test "create_workorder/1 with valid data creates a workorder" do
      assert {:ok, %Workorder{} = workorder} = Workorders.create_workorder(@valid_attrs)
      assert workorder.cost == 120.5
      assert workorder.date_start == ~D[2010-04-17]
      assert workorder.details == "some details"
      assert workorder.duration == 42
      assert workorder.status == "some status"
      assert workorder.title == "some title"
    end

    test "create_workorder/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Workorders.create_workorder(@invalid_attrs)
    end

    test "update_workorder/2 with valid data updates the workorder" do
      workorder = workorder_fixture()
      assert {:ok, workorder} = Workorders.update_workorder(workorder, @update_attrs)
      assert %Workorder{} = workorder
      assert workorder.cost == 456.7
      assert workorder.date_start == ~D[2011-05-18]
      assert workorder.details == "some updated details"
      assert workorder.duration == 43
      assert workorder.status == "some updated status"
      assert workorder.title == "some updated title"
    end

    test "update_workorder/2 with invalid data returns error changeset" do
      workorder = workorder_fixture()
      assert {:error, %Ecto.Changeset{}} = Workorders.update_workorder(workorder, @invalid_attrs)
      assert workorder == Workorders.get_workorder!(workorder.id)
    end

    test "delete_workorder/1 deletes the workorder" do
      workorder = workorder_fixture()
      assert {:ok, %Workorder{}} = Workorders.delete_workorder(workorder)
      assert_raise Ecto.NoResultsError, fn -> Workorders.get_workorder!(workorder.id) end
    end

    test "change_workorder/1 returns a workorder changeset" do
      workorder = workorder_fixture()
      assert %Ecto.Changeset{} = Workorders.change_workorder(workorder)
    end
  end
end
