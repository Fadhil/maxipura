defmodule CwmsWeb.PurchaseView do
  use CwmsWeb, :view
  alias Cwms.Repo
  alias Cwms.User
  import CwmsWeb.ProductView, only: [display_dollar_price: 1]

  def inventory_managers_list do
    Repo.all(User) |> Enum.map(&({&1.name, &1.id}))
  end

  def new_status(status) do
    case status do
      "new" ->
        "verified"
      "verified" ->
        "complete"
      "complete" ->
        nil
    end
  end

  def update_status_button_name(status) do
    case status do
      "new" ->
        "Verify"
      "verified" ->
        "Complete"
    end
  end

  def total_price(nil, _) do
    0.00
  end
  
  def total_price(quantity, price_cents) do
    (quantity * price_cents / 100)
  end
end
