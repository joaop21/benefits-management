defmodule Benefits.Repo.Migrations.CreateUsersProducts do
  use Ecto.Migration

  def change do
    create table(:users_products, primary_key: false) do
      add :user_id, references(:users, type: :uuid, on_delete: :delete_all), primary_key: true
      add :product_id, references(:products, on_delete: :delete_all), primary_key: true
    end

    create unique_index(:users_products, [:user_id, :product_id])
  end
end
