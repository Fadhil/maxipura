defmodule CwmsWeb.Router do
  use CwmsWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Cwms.Auth, repo: Cwms.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CwmsWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController, only: [:index, :show, :new, :create]
    resources "/sessions", SessionController, only: [:new, :create, :delete]

  end

  scope "/manage", CwmsWeb do
    pipe_through [:browser, :authenticate_user]
    resources "/vehicles", VehicleController
    resources "/workorders", WorkorderController
    resources "/profiles", ProfileController
    resources "/inventory", ProductController
    resources "/purchases", PurchaseController do
      resources "/items", ItemController 
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", CwmsWeb do
  #   pipe_through :api
  # end
end
