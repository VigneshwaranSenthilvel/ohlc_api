defmodule OhlcApiWeb.StockStatusControllerTest do
  use OhlcApiWeb.ConnCase

  alias OhlcApi.StockStatuses

  @create_attrs %{
    close: 120.5,
    high: 120.5,
    low: 120.5,
    open: 120.5
  }

  @invalid_attrs %{close: nil, high: nil, low: nil, open: nil}

  def fixture(:stock_status) do
    {:ok, stock_status} = StockStatuses.create_stock_status(@create_attrs)
    stock_status
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "average" do
    setup [:create_stock_statuses]

    test "lists all stock_statuses with last_20_items", %{conn: conn} do
      params = %{"window" => "last_20_items"}
      conn = get(conn, Routes.stock_status_path(conn, :index) <> "?" <> URI.encode_query(params))
      stock_status = json_response(conn, 200)["data"]
      assert Decimal.compare(stock_status["close"], Decimal.new("19.89")) == :eq
      assert Decimal.compare(stock_status["high"], Decimal.new("27.95")) == :eq
      assert Decimal.compare(stock_status["low"], Decimal.new("19.36")) == :eq
      assert Decimal.compare(stock_status["open"], Decimal.new("21.05")) == :eq
    end

    test "lists all stock_statuses with last_1_hour", %{conn: conn} do
      params = %{"window" => "last_1_hour"}
      conn = get(conn, Routes.stock_status_path(conn, :index) <> "?" <> URI.encode_query(params))
      stock_status = json_response(conn, 200)["data"]
      assert Decimal.compare(stock_status["close"], Decimal.new("22.75")) == :eq
      assert Decimal.compare(stock_status["high"], Decimal.new("30.96")) == :eq
      assert Decimal.compare(stock_status["low"], Decimal.new("22.41")) == :eq
      assert Decimal.compare(stock_status["open"], Decimal.new("24.15")) == :eq
    end
  end

  describe "create stock_status" do
    test "renders stock_status when data is valid", %{conn: conn} do
      conn = post(conn, Routes.stock_status_path(conn, :create), stock_status: @create_attrs)
      stock_status = json_response(conn, 201)["data"]
      assert stock_status["close"] == 120.5
      assert stock_status["high"] == 120.5
      assert stock_status["low"] == 120.5
      assert stock_status["open"] == 120.5
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.stock_status_path(conn, :create), stock_status: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  defp create_stock_statuses(_) do
    %{stock_statuses: OhlcApi.Seeds.StockStatusSeeds.create()}
  end
end
