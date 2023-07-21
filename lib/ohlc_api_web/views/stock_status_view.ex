defmodule OhlcApiWeb.StockStatusView do
  use OhlcApiWeb, :view
  alias OhlcApiWeb.StockStatusView

  def render("index.json", %{stock_statuses: stock_statuses}) do
    %{data: render_many(stock_statuses, StockStatusView, "stock_status.json")}
  end

  def render("show.json", %{stock_status: stock_status}) do
    %{data: render_one(stock_status, StockStatusView, "stock_status.json")}
  end

  def render("stock_status.json", %{stock_status: stock_status}) do
    %{
      open: stock_status.open,
      high: stock_status.high,
      low: stock_status.low,
      close: stock_status.close
    }
  end
end
