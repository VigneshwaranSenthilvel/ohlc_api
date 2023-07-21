defmodule OhlcApi.StockStatusesTest do
  use OhlcApi.DataCase

  alias OhlcApi.StockStatuses
  alias OhlcApi.Seeds.StockStatusSeeds

  describe "stock_statuses" do
    alias OhlcApi.StockStatuses.StockStatus

    @valid_attrs %{close: 120.5, high: 120.5, low: 120.5, open: 120.5}
    @invalid_attrs %{close: nil, high: nil, low: nil, open: nil}

    def stock_status_fixture(attrs \\ %{}) do
      {:ok, stock_status} =
        attrs
        |> Enum.into(@valid_attrs)
        |> StockStatuses.create_stock_status()

      stock_status
    end

    test "list_stock_statuses(last_20_items)" do
      StockStatusSeeds.create()
      stock_status = StockStatuses.list_stock_statuses("last_20_items")
      assert Decimal.compare(stock_status.close, Decimal.new("19.89")) ==:eq
      assert Decimal.compare(stock_status.high, Decimal.new("27.95")) ==:eq
      assert Decimal.compare(stock_status.low, Decimal.new("19.36")) ==:eq
      assert Decimal.compare(stock_status.open, Decimal.new("21.05")) ==:eq
    end

    test "list_stock_statuses(last_1_hour)" do
      StockStatusSeeds.create()
      stock_status = StockStatuses.list_stock_statuses("last_1_hour")
      assert Decimal.compare(stock_status.close, Decimal.new("22.75")) ==:eq
      assert Decimal.compare(stock_status.high, Decimal.new("30.96")) ==:eq
      assert Decimal.compare(stock_status.low, Decimal.new("22.41")) ==:eq
      assert Decimal.compare(stock_status.open, Decimal.new("24.15")) ==:eq
    end

    test "create_stock_status/1 with valid data creates a stock_status" do
      assert {:ok, %StockStatus{} = stock_status} = StockStatuses.create_stock_status(@valid_attrs)
      assert stock_status.close == 120.5
      assert stock_status.high == 120.5
      assert stock_status.low == 120.5
      assert stock_status.open == 120.5
    end

    test "create_stock_status/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = StockStatuses.create_stock_status(@invalid_attrs)
    end

  end
end
