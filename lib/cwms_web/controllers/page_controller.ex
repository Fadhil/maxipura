defmodule CwmsWeb.PageController do
  use CwmsWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
