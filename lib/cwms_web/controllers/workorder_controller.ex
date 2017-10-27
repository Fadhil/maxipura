defmodule CwmsWeb.WorkorderController do
  use CwmsWeb, :controller

  alias Cwms.Workorders
  alias Cwms.Workorders.Workorder

  def index(conn, _params) do
    workorders = Workorders.list_workorders()
    render(conn, "index.html", workorders: workorders)
  end

  def new(conn, _params) do
    changeset = Workorders.change_workorder(%Workorder{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"workorder" => workorder_params}) do
    case Workorders.create_workorder(workorder_params) do
      {:ok, workorder} ->
        conn
        |> put_flash(:info, "Workorder created successfully.")
        |> redirect(to: workorder_path(conn, :show, workorder))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    workorder = Workorders.get_workorder!(id)
    render(conn, "show.html", workorder: workorder)
  end

  def edit(conn, %{"id" => id}) do
    workorder = Workorders.get_workorder!(id)
    changeset = Workorders.change_workorder(workorder)
    render(conn, "edit.html", workorder: workorder, changeset: changeset)
  end

  def update(conn, %{"id" => id, "workorder" => workorder_params}) do
    workorder = Workorders.get_workorder!(id)

    case Workorders.update_workorder(workorder, workorder_params) do
      {:ok, workorder} ->
        conn
        |> put_flash(:info, "Workorder updated successfully.")
        |> redirect(to: workorder_path(conn, :show, workorder))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", workorder: workorder, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    workorder = Workorders.get_workorder!(id)
    {:ok, _workorder} = Workorders.delete_workorder(workorder)

    conn
    |> put_flash(:info, "Workorder deleted successfully.")
    |> redirect(to: workorder_path(conn, :index))
  end
end
