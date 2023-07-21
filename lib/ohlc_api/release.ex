defmodule OhlcApi.Release do
  @moduledoc false

  @start_apps [
    :postgrex,
    :ecto,
    :ecto_sql
  ]

  @myapps [
    :ohlc_api
  ]

  @repos [
    OhlcApi.Repo
  ]

  def run_migrations do
    IO.puts("Loading...")
    # Load the code for myapp, but don't start it
    :ok = Application.load(:ohlc_api)

    IO.puts("Starting dependencies..")
    # Start apps necessary for executing migrations
    Enum.each(@start_apps, &Application.ensure_all_started/1)

    # Start the Repo(s) for myapp
    IO.puts("Starting repos..")
    Enum.each(@repos, & &1.start_link(pool_size: 2))

    # Run migrations
    Enum.each(@myapps, &run_migrations_for/1)
    # Signal shutdown
    IO.puts("Success!")
    :init.stop()
  end

  def run_seed do
    IO.puts("Loading...")
    # Load the code for myapp, but don't start it
    :ok = Application.load(:ohlc_api)

    IO.puts("Starting dependencies..")
    # Start apps necessary for executing migrations
    Enum.each(@start_apps, &Application.ensure_all_started/1)

    # Start the Repo(s) for myapp
    IO.puts("Starting repos..")
    Enum.each(@repos, & &1.start_link(pool_size: 2))

    # Run migrations
    Enum.each(@myapps, &seed_path/1)

    seed_script = seed_path(:ohlc_api)

    if File.exists?(seed_script) do
      IO.puts("Running seed script..")
      Code.eval_file(seed_script)
    end

    # Signal shutdown
    IO.puts("Success!")
    :init.stop()
  end

  def priv_dir(app), do: "#{:code.priv_dir(app)}"

  defp run_migrations_for(app) do
    IO.puts("Running migrations for #{app}")
    Ecto.Migrator.run(OhlcApi.Repo, migrations_path(app), :up, all: true)
  end

  defp migrations_path(app), do: Path.join([priv_dir(app), "repo", "migrations"])
  defp seed_path(app), do: Path.join([priv_dir(app), "repo", "seeds.exs"])
end
