defmodule OhlcApi.StockStatuses.StockStatus do
  use Ecto.Schema
  import Ecto.Changeset

  schema "stock_statuses" do
    field :close, :float
    field :high, :float
    field :low, :float
    field :open, :float

    timestamps()
  end

  @doc false
  def changeset(stock_status, attrs) do
    stock_status
    |> cast(attrs, [:open, :high, :low, :close])
    |> validate_required([:open, :high, :low, :close])
  end
end
