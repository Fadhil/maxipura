defmodule Cwms.Workorders do
  @moduledoc """
  The Workorders context.
  """

  import Ecto.Query, warn: false
  alias Cwms.Repo

  alias Cwms.Workorders.Workorder

  @doc """
  Returns the list of workorders.

  ## Examples

      iex> list_workorders()
      [%Workorder{}, ...]

  """
  def list_workorders do
    Repo.all(Workorder)
  end

  @doc """
  Gets a single workorder.

  Raises `Ecto.NoResultsError` if the Workorder does not exist.

  ## Examples

      iex> get_workorder!(123)
      %Workorder{}

      iex> get_workorder!(456)
      ** (Ecto.NoResultsError)

  """
  def get_workorder!(id), do: Repo.get!(Workorder, id)

  @doc """
  Creates a workorder.

  ## Examples

      iex> create_workorder(%{field: value})
      {:ok, %Workorder{}}

      iex> create_workorder(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_workorder(attrs \\ %{}) do
    %Workorder{}
    |> Workorder.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a workorder.

  ## Examples

      iex> update_workorder(workorder, %{field: new_value})
      {:ok, %Workorder{}}

      iex> update_workorder(workorder, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_workorder(%Workorder{} = workorder, attrs) do
    workorder
    |> Workorder.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Workorder.

  ## Examples

      iex> delete_workorder(workorder)
      {:ok, %Workorder{}}

      iex> delete_workorder(workorder)
      {:error, %Ecto.Changeset{}}

  """
  def delete_workorder(%Workorder{} = workorder) do
    Repo.delete(workorder)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking workorder changes.

  ## Examples

      iex> change_workorder(workorder)
      %Ecto.Changeset{source: %Workorder{}}

  """
  def change_workorder(%Workorder{} = workorder) do
    Workorder.changeset(workorder, %{})
  end
end
