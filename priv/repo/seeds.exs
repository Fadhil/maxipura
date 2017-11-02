# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Cwms.Repo.insert!(%Cwms.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Cwms.Repo
alias Cwms.Role

for role <- ~w(Admin ServiceAdvisor InventoryManager SaleAdvisor Management Customer) do
  Repo.get_by(Role, name: role) ||
    Repo.insert!(%Role{name: role})
end
