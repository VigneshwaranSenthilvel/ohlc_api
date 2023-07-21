import Config

config :ohlc_api, OhlcApiWeb.Endpoint, server: true

config :ohlc_api, OhlcApiWeb.Endpoint,
  # http: [
  #   port: String.to_integer(System.get_env("PORT") || "4000"),
  #   transport_options: [socket_opts: [:inet6]]
  # ],
  secret_key_base: "J6NXPEbcwEwtI1jNOQcINkapOR+j0FZrobc9p7E33R0gyZtIAzdaLWkeHYC0IpLG"

# Then you can assemble a release by calling `mix release`.
# See `mix help release` for more information.

config :ohlc_api, OhlcApi.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: System.get_env("POSTGRES_USER", "postgres"),
  password: System.get_env("POSTGRES_PASSWORD", "postgres"),
  hostname: System.get_env("POSTGRES_HOST", "localhost"),
  database: System.get_env("POSTGRES_DATABASE", "ohlc_api"),
  pool_size: 15
