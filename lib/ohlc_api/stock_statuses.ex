defmodule OhlcApi.StockStatuses do
  @moduledoc """
  The StockStatuses context.
  """

  import Ecto.Query, warn: false
  alias OhlcApi.Repo

  alias OhlcApi.StockStatuses.StockStatus

  @doc """
  Returns the list of stock_statuses.

  ## Examples

      iex> list_stock_statuses()
      [%StockStatus{}, ...]

  """
  def list_stock_statuses("last_20_items") do
    sub_query =
      from(ss in StockStatus,
        order_by: [desc: ss.id],
        limit: 20,
        select: ss
        )

      from(ss in subquery(sub_query),
        select: %{
          open: fragment("CAST(AVG(?) AS numeric(10, 2))", ss.open),
          high: fragment("CAST(AVG(?) AS numeric(10, 2))", ss.high),
          low: fragment("CAST(AVG(?) AS numeric(10, 2))", ss.low),
          close: fragment("CAST(AVG(?) AS numeric(10, 2))", ss.close)
        }
      )
      |> Repo.one()
  end

  def list_stock_statuses("last_1_hour") do
    one_hour_ago = DateTime.utc_now() |> DateTime.add(-3600)

    from(ss in StockStatus,
      where: ss.inserted_at >= ^one_hour_ago,
        select: %{
          open: fragment("CAST(AVG(?) AS numeric(10, 2))", ss.open),
          high: fragment("CAST(AVG(?) AS numeric(10, 2))", ss.high),
          low: fragment("CAST(AVG(?) AS numeric(10, 2))", ss.low),
          close: fragment("CAST(AVG(?) AS numeric(10, 2))", ss.close)
        }
      )
    |> Repo.one()
  end


  @doc """
  Creates a stock_status.

  ## Examples

      iex> create_stock_status(%{field: value})
      {:ok, %StockStatus{}}

      iex> create_stock_status(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_stock_status(attrs \\ %{}) do
    %StockStatus{}
    |> StockStatus.changeset(attrs)
    |> Repo.insert()
  end
end
