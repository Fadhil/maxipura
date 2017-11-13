defmodule CwmsWeb.PurchaseView do
  use CwmsWeb, :view
  alias Cwms.Repo
  alias Cwms.User

  def inventory_managers_list do
    Repo.all(User) |> Enum.map(&({&1.name, &1.id}))
  end
end
