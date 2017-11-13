defmodule CwmsWeb.PurchaseController do
  use CwmsWeb, :controller

  alias Cwms.Inventory
  alias Cwms.Inventory.Purchase
  alias Cwms.Repo

  def index(conn, _params) do
    purchases = Inventory.list_purchases()
    render(conn, "index.html", purchases: purchases)
  end

  def new(conn, _params) do
    changeset = Inventory.change_purchase(%Purchase{})
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
      |> Repo.preload([:requester, :person_in_charge])
    render(conn, "show.html", purchase: purchase)
  end

  def edit(conn, %{"id" => id}) do
    purchase = Inventory.get_purchase!(id)
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

  def delete(conn, %{"id" => id}) do
    purchase = Inventory.get_purchase!(id)
    {:ok, _purchase} = Inventory.delete_purchase(purchase)

    conn
    |> put_flash(:info, "Purchase deleted successfully.")
    |> redirect(to: purchase_path(conn, :index))
  end
end
