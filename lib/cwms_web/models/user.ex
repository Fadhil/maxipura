defmodule Cwms.User do
  use CwmsWeb, :model

  schema "users" do
    field :name, :string
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    has_one :profiles, Cwms.Accounts.Profile
    # has_many :vehicles, Cwms.Vehicle
    belongs_to :role, Cwms.Roles

    timestamps()
  end
  
  @required_fields ~w(name email password)
  @optional_fields ~w(role_id)

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, ~w(name email), [])
    |> validate_length(:email, min: 3, max: 100)
    |> unique_constraint(:email)
  end

  def registration_changeset(model, params) do
    model
    |> changeset(params)
    |> cast(params, ~w(password), [])
    |> validate_length(:password, min: 6, max: 100)
    |> put_pass_hash()
  end

  defp put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))
        _ ->
          changeset
    end
  end
end
