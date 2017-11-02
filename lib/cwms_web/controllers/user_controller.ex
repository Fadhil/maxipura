defmodule CwmsWeb.UserController do
  use CwmsWeb, :controller
  alias Cwms.Repo
  alias Cwms.User
  alias Cwms.Role

  plug :authenticate_user when action in [:index, :show]
  plug :load_roles when action in [:new, :create]

  defp load_roles(conn, _) do
    query =
      Role
      |> Role.alphabetical
      |> Role.names_and_ids
    roles = Repo.all query
    assign(conn, :roles, roles)
  end

  def index(conn, _params) do
      users = Repo.all(Cwms.User)
      render conn, "index.html", users: users
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get(Cwms.User, id)
    render conn, "show.html", user: user
  end

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.registration_changeset(%User{}, user_params)
    case Repo.insert(changeset) do
    {:ok, user} ->
      conn
      |> Cwms.Auth.login(user)
      |> put_flash(:info, "#{user.name} created")
      |> redirect(to: user_path(conn, :index))
    {:error, changeset} ->
      render(conn, "new.html", changeset: changeset)
    end
  end


  # defp authenticate(conn, _opts) do
  #   if conn.assigns.current_user do
  #     conn
  #   else
  #     conn
  #     |> put_flash(:error, "You must be logged in to access that page")
  #     |> redirect(to: page_path(conn, :index))
  #     |> halt()
  #   end
  # end
end
