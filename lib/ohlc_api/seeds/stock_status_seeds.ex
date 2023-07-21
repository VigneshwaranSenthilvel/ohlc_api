defmodule OhlcApi.Seeds.StockStatusSeeds do
  alias OhlcApi.Repo
alias OhlcApi.StockStatuses.StockStatus

def create do
  now = NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)
  one_hour_before = NaiveDateTime.utc_now() |> NaiveDateTime.add(-4000, :second) |> NaiveDateTime.truncate(:second)

  stock_statuses = [
    %{open: 08.01, high: 15.13, low: 06.91, close: 08.04, inserted_at: one_hour_before, updated_at: one_hour_before },
    %{open: 09.01, high: 16.34, low: 07.43, close: 08.43, inserted_at: one_hour_before, updated_at: one_hour_before },
    %{open: 10.23, high: 17.66, low: 08.91, close: 15.04, inserted_at: one_hour_before, updated_at: one_hour_before },
    %{open: 11.15, high: 18.21, low: 09.91, close: 11.04, inserted_at: one_hour_before, updated_at: one_hour_before },
    %{open: 12.54, high: 19.17, low: 10.91, close: 12.04, inserted_at: one_hour_before, updated_at: one_hour_before },
    %{open: 13.74, high: 20.13, low: 11.91, close: 14.04, inserted_at: one_hour_before, updated_at: one_hour_before },
    %{open: 14.35, high: 21.98, low: 12.91, close: 13.04, inserted_at: one_hour_before, updated_at: one_hour_before },
    %{open: 15.12, high: 22.16, low: 12.91, close: 14.04, inserted_at: one_hour_before, updated_at: one_hour_before },
    %{open: 16.00, high: 23.88, low: 14.91, close: 15.04, inserted_at: one_hour_before, updated_at: one_hour_before },
    %{open: 17.31, high: 24.45, low: 15.91, close: 16.04, inserted_at: now, updated_at: now },
    %{open: 18.82, high: 25.33, low: 16.91, close: 17.04, inserted_at: now, updated_at: now },
    %{open: 19.32, high: 26.64, low: 17.91, close: 18.04, inserted_at: now, updated_at: now },
    %{open: 20.86, high: 27.86, low: 18.91, close: 19.04, inserted_at: now, updated_at: now },
    %{open: 21.88, high: 28.74, low: 19.91, close: 20.04, inserted_at: now, updated_at: now },
    %{open: 22.43, high: 28.18, low: 20.91, close: 21.04, inserted_at: now, updated_at: now },
    %{open: 23.63, high: 30.19, low: 21.91, close: 22.04, inserted_at: now, updated_at: now },
    %{open: 24.34, high: 31.45, low: 22.91, close: 23.04, inserted_at: now, updated_at: now },
    %{open: 25.94, high: 32.56, low: 23.91, close: 24.04, inserted_at: now, updated_at: now },
    %{open: 26.95, high: 33.21, low: 24.91, close: 25.04, inserted_at: now, updated_at: now },
    %{open: 27.39, high: 34.95, low: 25.91, close: 29.04, inserted_at: now, updated_at: now },
    %{open: 28.94, high: 35.48, low: 26.91, close: 27.04, inserted_at: now, updated_at: now },
    %{open: 29.36, high: 36.87, low: 27.91, close: 28.04, inserted_at: now, updated_at: now },
    %{open: 30.99, high: 37.54, low: 28.91, close: 28.97, inserted_at: now, updated_at: now },
  ]

  Repo.insert_all(StockStatus, stock_statuses, returning: true)
  end
end
