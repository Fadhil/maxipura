defmodule Cwms.VehiclesTest do
  use Cwms.DataCase

  alias Cwms.Vehicles

  describe "vehicles" do
    alias Cwms.Vehicles.Vehicle

    @valid_attrs %{" no_plate": "some  no_plate", issue: "some issue", type: "some type"}
    @update_attrs %{" no_plate": "some updated  no_plate", issue: "some updated issue", type: "some updated type"}
    @invalid_attrs %{" no_plate": nil, issue: nil, type: nil}

    def vehicle_fixture(attrs \\ %{}) do
      {:ok, vehicle} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Vehicles.create_vehicle()

      vehicle
    end

    test "list_vehicles/0 returns all vehicles" do
      vehicle = vehicle_fixture()
      assert Vehicles.list_vehicles() == [vehicle]
    end

    test "get_vehicle!/1 returns the vehicle with given id" do
      vehicle = vehicle_fixture()
      assert Vehicles.get_vehicle!(vehicle.id) == vehicle
    end

    test "create_vehicle/1 with valid data creates a vehicle" do
      assert {:ok, %Vehicle{} = vehicle} = Vehicles.create_vehicle(@valid_attrs)
      assert vehicle. no_plate == "some  no_plate"
      assert vehicle.issue == "some issue"
      assert vehicle.type == "some type"
    end

    test "create_vehicle/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Vehicles.create_vehicle(@invalid_attrs)
    end

    test "update_vehicle/2 with valid data updates the vehicle" do
      vehicle = vehicle_fixture()
      assert {:ok, vehicle} = Vehicles.update_vehicle(vehicle, @update_attrs)
      assert %Vehicle{} = vehicle
      assert vehicle. no_plate == "some updated  no_plate"
      assert vehicle.issue == "some updated issue"
      assert vehicle.type == "some updated type"
    end

    test "update_vehicle/2 with invalid data returns error changeset" do
      vehicle = vehicle_fixture()
      assert {:error, %Ecto.Changeset{}} = Vehicles.update_vehicle(vehicle, @invalid_attrs)
      assert vehicle == Vehicles.get_vehicle!(vehicle.id)
    end

    test "delete_vehicle/1 deletes the vehicle" do
      vehicle = vehicle_fixture()
      assert {:ok, %Vehicle{}} = Vehicles.delete_vehicle(vehicle)
      assert_raise Ecto.NoResultsError, fn -> Vehicles.get_vehicle!(vehicle.id) end
    end

    test "change_vehicle/1 returns a vehicle changeset" do
      vehicle = vehicle_fixture()
      assert %Ecto.Changeset{} = Vehicles.change_vehicle(vehicle)
    end
  end
end
