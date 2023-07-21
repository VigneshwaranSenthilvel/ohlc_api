# OhlcApi

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

## Swagger UI for endpoints
  * [`localhost:4000/swaggerui`](http://localhost:4000/swaggerui)

## Production Build

 * run the commend `./build.sh`
 * `_build/prod/rel/ohlc_api/bin/ohlc_api eval "OhlcApi.Release.run_migrations()"`
 * `_build/prod/rel/ohlc_api/bin/ohlc_api eval "OhlcApi.Release.run_seed()"`
 * temporary run `_build/prod/rel/ohlc_api/bin/ohlc_api start` 
 * backgroud run `_build/prod/rel/ohlc_api/bin/ohlc_api daemon` 