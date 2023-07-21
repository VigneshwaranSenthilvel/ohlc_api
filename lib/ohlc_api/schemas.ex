defmodule OhlcApi.Schemas do
  alias OpenApiSpex.Schema

  defmodule StockStatusParam do
    require OpenApiSpex

    OpenApiSpex.schema(%{
      # The title is optional. It defaults to the last section of the module name.
      # So the derived title for MyApp.User is "User".
      title: "StockStatus",
      description: "StockStatus",
      type: :object,
      properties: %{
        id: %Schema{type: :integer, description: "Stock Status ID"},
        open: %Schema{type: :float, description: "Open"},
        high: %Schema{type: :float, description: "high"},
        low: %Schema{type: :float, description: "low"},
        close: %Schema{type: :float, description: "close"},
        inserted_at: %Schema{
          type: :string,
          description: "Creation timestamp",
          format: :"date-time"
        },
        updated_at: %Schema{type: :string, description: "Update timestamp", format: :"date-time"}
      },
      required: [:open, :high, :low, :close],
      example: %{"stock_status": %{
        "open" => 10.01,
        "high" => 13.59,
        "low" => 09.65,
        "close" => 11.21,
      }}
    })
  end

  defmodule StockStatusResponse do
    require OpenApiSpex

    OpenApiSpex.schema(%{
      title: "StockStatusResponse",
      description: "Response schema for moving average",
      type: :object,
      properties: %{
        data: StockStatusParam
      },
      example: %{
        "open" => 10.01,
        "high" => 13.59,
        "low" => 09.65,
        "close" => 11.21,
        }
    })
  end
end
