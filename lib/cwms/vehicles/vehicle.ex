defmodule Cwms.Vehicles.Vehicle do
  use Ecto.Schema
  import Ecto.Changeset
  alias Cwms.Vehicles.Vehicle


  schema "vehicles" do
    field :no_plate, :string
    field :issue, :string
    field :type, :string
    field :model, :string
    field :color, :string
    #field :user_id, :id
    # belongs_to :user, Cwms.User

    timestamps()
  end

  # @doc false
  # def changeset(%Vehicle{} = vehicle, attrs) do
  #   vehicle
  #   |> cast(attrs, [:no_plate, :type, :model, :color, :issue])
  #   |> validate_required([:no_plate, :type, :model, :color, :issue])
  # end
  @required_fields ~w(no_plate issue type model color)
  @optional_fields ~w()

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
