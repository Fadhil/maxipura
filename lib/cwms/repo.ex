defmodule Cwms.Repo do
  use Ecto.Repo, otp_app: :cwms

  @doc """
  Dynamically loads the repository url from the
  DATABASE_URL environment variable.
  """
  def init(_, opts) do
    {:ok, Keyword.put(opts, :url, System.get_env("DATABASE_URL"))}
  end
end
# defmodule Cwms.Repo do
#   @moduledoc """
#   In memory repository
#   """
#   def all(Cwms.User) do
#     [
#       %Cwms.User{id: "1", name: "haziq", username: "haziqazmi", email: "haziq@flexcility.com",password: "elixir"},
#       %Cwms.User{id: "2", name: "shada", username: "shud", email: "shud@gmail.com",password: "elixir"}
#     ]
#   end
#   def all(_module), do: []
#
#   def get(module, id) do
#     Enum.find all(module), fn map -> map.id == id end
#   end
#
#   def get_by(module, params) do
#     Enum.find all(module), fn map ->
#       Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
#     end
#   end
#
# end
