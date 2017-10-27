defmodule CwmsWeb.InventoryController do
  use CwmsWeb, :controller

  alias Cwms.Inventories
  alias Cwms.Inventories.Inventory

  def index(conn, _params) do
    inventories = Inventories.list_inventories()
    render(conn, "index.html", inventories: inventories)
  end

  def new(conn, _params) do
    changeset = Inventories.change_inventory(%Inventory{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"inventory" => inventory_params}) do
    case Inventories.create_inventory(inventory_params) do
      {:ok, inventory} ->
        conn
        |> put_flash(:info, "Inventory created successfully.")
        |> redirect(to: inventory_path(conn, :show, inventory))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    inventory = Inventories.get_inventory!(id)
    render(conn, "show.html", inventory: inventory)
  end

  def edit(conn, %{"id" => id}) do
    inventory = Inventories.get_inventory!(id)
    changeset = Inventories.change_inventory(inventory)
    render(conn, "edit.html", inventory: inventory, changeset: changeset)
  end

  def update(conn, %{"id" => id, "inventory" => inventory_params}) do
    inventory = Inventories.get_inventory!(id)

    case Inventories.update_inventory(inventory, inventory_params) do
      {:ok, inventory} ->
        conn
        |> put_flash(:info, "Inventory updated successfully.")
        |> redirect(to: inventory_path(conn, :show, inventory))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", inventory: inventory, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    inventory = Inventories.get_inventory!(id)
    {:ok, _inventory} = Inventories.delete_inventory(inventory)

    conn
    |> put_flash(:info, "Inventory deleted successfully.")
    |> redirect(to: inventory_path(conn, :index))
  end
end
