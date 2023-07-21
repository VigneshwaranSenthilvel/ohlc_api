defmodule Mix.Tasks.OhlcApi.OpenApiSpec do
  def run([output_file]) do
    json =
      OhlcApiWeb.ApiSpec.spec()
      |> Jason.encode!(pretty: true)

    :ok = File.write!(output_file, json)
  end
end
