defmodule CwmsWeb.PurchaseController do
  use CwmsWeb, :controller

  alias Cwms.Inventory
  alias Cwms.Inventory.{Purchase, Item}
  alias Cwms.Repo

  def index(conn, _params) do
    purchases = Inventory.list_purchases() |> Repo.preload([:person_in_charge, :requester])
    render(conn, "index.html", purchases: purchases)
  end

  def new(conn, _params) do
    changeset = Inventory.change_purchase(%Purchase{items: [
        %Item{}, %Item{},%Item{},%Item{},%Item{}
      ]})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"purchase" => purchase_params}) do
    case Inventory.create_purchase(purchase_params) do
      {:ok, purchase} ->
        conn
        |> put_flash(:info, "Purchase created successfully.")
        |> redirect(to: purchase_path(conn, :show, purchase))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    purchase = Inventory.get_purchase!(id)
      |> Repo.preload([:requester, :person_in_charge, :items])
    render(conn, "show.html", purchase: purchase)
  end

  def edit(conn, %{"id" => id}) do
    purchase = Inventory.get_purchase!(id) |> Repo.preload([:person_in_charge, :requester, :items])
    changeset = Inventory.change_purchase(purchase)
    render(conn, "edit.html", purchase: purchase, changeset: changeset)
  end

  def update(conn, %{"id" => id, "purchase" => purchase_params}) do
    purchase = Inventory.get_purchase!(id)

    case Inventory.update_purchase(purchase, purchase_params) do
      {:ok, purchase} ->
        conn
        |> put_flash(:info, "Purchase updated successfully.")
        |> redirect(to: purchase_path(conn, :show, purchase))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", purchase: purchase, changeset: changeset)
    end
  end

  def update(conn, %{"id" => id, "status" => status}) do
    purchase = Inventory.get_purchase!(id) |> Repo.preload([:person_in_charge, :requester, :items])
    case status do
      "verified" ->
         # Inventory.update_inventory_products(purchase.items)
         update_status(conn, purchase, "verified")
      "completed" ->
         update_status(conn, purchase, "completed")
      _ ->
        conn
        |> put_flash(:info, "Purchase updated successfully.")
        |> redirect(to: purchase_path(conn, :show, purchase))
    end
  end

  def update_status(conn, purchase, status) do
    case Inventory.update_purchase(purchase, %{status: status}) do
      {:ok, purchase} ->
        purchase |> Repo.preload([:person_in_charge, :requester, :items])
        conn
        |> put_flash(:info, "Purchase updated successfully.")
        |> redirect(to: purchase_path(conn, :show, purchase))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "show.html", purchase: purchase)
    end
  end

  def delete(conn, %{"id" => id}) do
    purchase = Inventory.get_purchase!(id)
    {:ok, _purchase} = Inventory.delete_purchase(purchase)

    conn
    |> put_flash(:info, "Purchase deleted successfully.")
    |> redirect(to: purchase_path(conn, :index))
  end
end
