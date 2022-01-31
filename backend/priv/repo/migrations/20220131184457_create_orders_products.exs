defmodule Benefits.Repo.Migrations.CreateOrdersProducts do
  use Ecto.Migration

  def change do
    create table(:orders_products, primary_key: false) do
      add :order_id, references(:orders, type: :uuid, on_delete: :delete_all), primary_key: true
      add :product_id, references(:products, on_delete: :delete_all), primary_key: true
    end

    create unique_index(:orders_products, [:order_id, :product_id])
  end
end
