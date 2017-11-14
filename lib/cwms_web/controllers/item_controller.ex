defmodule CwmsWeb.ItemController do
  use CwmsWeb, :controller

  alias Cwms.Inventory
  alias Cwms.Inventory.Item

  def index(conn, _params) do
    items = Inventory.list_items()
    render(conn, "index.html", items: items)
  end

  def new(conn, _params) do
    changeset = Inventory.change_item(%Item{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"item" => item_params, "purchase_id" => purchase_id}) do
    case Inventory.create_item(item_params) do
      {:ok, item} ->
        conn
        |> put_flash(:info, "Item created successfully.")
        |> redirect(to: purchase_item_path(conn, :show, id: item, purchase_id: purchase_id))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    item = Inventory.get_item!(id)
    render(conn, "show.html", item: item)
  end

  def edit(conn, %{"id" => id, "purchase_id" => purchase_id}) do
    item = Inventory.get_item!(id)
    changeset = Inventory.change_item(item)
    render(conn, "edit.html", item: item, changeset: changeset)
  end

  def update(conn, %{"id" => id, "purchase_id" => purchase_id, "item" => item_params}) do
    item = Inventory.get_item!(id)

    case Inventory.update_item(item, item_params) do
      {:ok, item} ->
        conn
        |> put_flash(:info, "Item updated successfully.")
        |> redirect(to: purchase_item_path(conn, :show, purchase_id: purchase_id, id: item))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", item: item, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id, "purchase_id" => purchase_id}) do
    item = Inventory.get_item!(id)
    {:ok, _item} = Inventory.delete_item(item)

    conn
    |> put_flash(:info, "Item deleted successfully.")
    |> redirect(to: purchase_item_path(conn, :index, purchase_id))
  end
end
