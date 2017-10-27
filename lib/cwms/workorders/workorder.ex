defmodule Cwms.Workorders.Workorder do
  use Ecto.Schema
  import Ecto.Changeset
  alias Cwms.Workorders.Workorder


  schema "workorders" do
    field :cost, :float
    field :date_start, :date
    field :details, :string
    field :duration, :integer
    field :status, :string
    field :title, :string
    # field :vehicle_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Workorder{} = workorder, attrs) do
    workorder
    |> cast(attrs, [:title, :details, :cost, :date_start, :duration, :status])
    |> validate_required([:title, :details, :cost, :date_start, :duration, :status])
  end
end
