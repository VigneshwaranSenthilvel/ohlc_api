defmodule OhlcApi.Repo do
  use Ecto.Repo,
    otp_app: :ohlc_api,
    adapter: Ecto.Adapters.Postgres
end
