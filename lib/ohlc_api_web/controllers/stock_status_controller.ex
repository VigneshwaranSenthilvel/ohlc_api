defmodule OhlcApiWeb.StockStatusController do
  use OhlcApiWeb, :controller
  use OpenApiSpex.ControllerSpecs

  alias OhlcApi.Schemas.{StockStatusParam, StockStatusResponse}
  alias OhlcApi.StockStatuses
  alias OhlcApi.StockStatuses.StockStatus

  action_fallback OhlcApiWeb.FallbackController


  tags ["Moving Avarage"]
  security [%{}, %{"petstore_auth" => ["write:stock_statuses", "read:stock_statuses"]}]

  operation :index,
    summary: "Moving Average",
    parameters: [
      window: [in: :query, description: "last_20_items / last_1_hour", type: :string, example: "last_20_items"]
    ],
    request_body: {},
    responses: [
      ok: {"StockStatus Response", "application/json", StockStatusResponse}
    ]

  def index(conn, %{"window" => window}) do
    stock_statuses = StockStatuses.list_stock_statuses(window)
    render(conn, "show.json", stock_status: stock_statuses)
  end

  tags ["Stock Status Create"]
  security [%{}, %{"petstore_auth" => ["write:stock_statuses", "read:stock_statuses"]}]
  operation :create,
    summary: "Create Stock Status",
    parameters: [],
    request_body: {"User params", "application/json", StockStatusParam},
    responses: [
      ok: {"StockStatus Response", "application/json", StockStatusResponse}
    ]
  def create(conn, %{"stock_status" => stock_status_params}) do
    with {:ok, %StockStatus{} = stock_status} <- StockStatuses.create_stock_status(stock_status_params) do
      conn
      |> put_status(:created)
      |> render("show.json", stock_status: stock_status)
    end
  end
end
