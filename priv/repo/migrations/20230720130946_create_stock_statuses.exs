defmodule OhlcApi.Repo.Migrations.CreateStockStatuses do
  use Ecto.Migration

  def change do
    create table(:stock_statuses) do
      add :open, :float
      add :high, :float
      add :low, :float
      add :close, :float

      timestamps()
    end

  end
end
