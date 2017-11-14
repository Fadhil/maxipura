defmodule CwmsWeb.PurchaseView do
  use CwmsWeb, :view
  alias Cwms.Repo
  alias Cwms.User
  import CwmsWeb.ProductView, only: [display_dollar_price: 1]

  def inventory_managers_list do
    Repo.all(User) |> Enum.map(&({&1.name, &1.id}))
  end
end
