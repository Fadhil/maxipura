defmodule Cwms.AccountsTest do
  use Cwms.DataCase

  alias Cwms.Accounts

  describe "profiles" do
    alias Cwms.Accounts.Profile

    @valid_attrs %{address: "some address", fullname: "some fullname", icno: "some icno", n: "some n", phone: "some phone"}
    @update_attrs %{address: "some updated address", fullname: "some updated fullname", icno: "some updated icno", n: "some updated n", phone: "some updated phone"}
    @invalid_attrs %{address: nil, fullname: nil, icno: nil, n: nil, phone: nil}

    def profile_fixture(attrs \\ %{}) do
      {:ok, profile} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_profile()

      profile
    end

    test "list_profiles/0 returns all profiles" do
      profile = profile_fixture()
      assert Accounts.list_profiles() == [profile]
    end

    test "get_profile!/1 returns the profile with given id" do
      profile = profile_fixture()
      assert Accounts.get_profile!(profile.id) == profile
    end

    test "create_profile/1 with valid data creates a profile" do
      assert {:ok, %Profile{} = profile} = Accounts.create_profile(@valid_attrs)
      assert profile.address == "some address"
      assert profile.fullname == "some fullname"
      assert profile.icno == "some icno"
      assert profile.n == "some n"
      assert profile.phone == "some phone"
    end

    test "create_profile/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_profile(@invalid_attrs)
    end

    test "update_profile/2 with valid data updates the profile" do
      profile = profile_fixture()
      assert {:ok, profile} = Accounts.update_profile(profile, @update_attrs)
      assert %Profile{} = profile
      assert profile.address == "some updated address"
      assert profile.fullname == "some updated fullname"
      assert profile.icno == "some updated icno"
      assert profile.n == "some updated n"
      assert profile.phone == "some updated phone"
    end

    test "update_profile/2 with invalid data returns error changeset" do
      profile = profile_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_profile(profile, @invalid_attrs)
      assert profile == Accounts.get_profile!(profile.id)
    end

    test "delete_profile/1 deletes the profile" do
      profile = profile_fixture()
      assert {:ok, %Profile{}} = Accounts.delete_profile(profile)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_profile!(profile.id) end
    end

    test "change_profile/1 returns a profile changeset" do
      profile = profile_fixture()
      assert %Ecto.Changeset{} = Accounts.change_profile(profile)
    end
  end
end
