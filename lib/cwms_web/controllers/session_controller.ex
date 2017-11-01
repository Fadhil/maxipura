defmodule CwmsWeb.SessionController do
  use CwmsWeb, :controller
  alias Cwms.Repo
  alias Cwms.User

  def new(conn, _) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => %{"email" => email, "password" => pass}}) do
    case Cwms.Auth.login_by_email_and_pass(conn, email, pass, repo: Repo) do
      {:ok, conn} ->
        conn
        |> put_flash(:info, "Welcome Back!")
        |> redirect(to: page_path(conn, :index))
      {:error, _reason, conn} ->
        conn
        |> put_flash(:error, "Invalid Email/password combination")
        |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> Cwms.Auth.logout()
    |> redirect(to: page_path(conn, :index))
  end

end
