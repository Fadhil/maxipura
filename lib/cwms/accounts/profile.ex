defmodule Cwms.Accounts.Profile do
  use Ecto.Schema
  import Ecto.Changeset
  alias Cwms.Accounts.Profile


  schema "profiles" do
    field :address, :string
    field :fullname, :string
    field :icno, :string
    field :phone, :string
    belongs_to :user, Cwms.User, foreign_key: :user_id
    timestamps()
  end

  @doc false
  def changeset(%Profile{} = profile, attrs) do
    profile
    |> cast(attrs, [:fullname, :icno, :phone, :address])
    |> validate_required([:fullname, :icno, :phone, :address])
  end
end
