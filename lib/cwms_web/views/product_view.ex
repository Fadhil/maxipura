defmodule CwmsWeb.ProductView do
  use CwmsWeb, :view

  def display_dollar_price(price_in_cents) when is_integer(price_in_cents) do
    price_in_cents/100
    |> Float.to_string(decimals: 2)
  end
end
