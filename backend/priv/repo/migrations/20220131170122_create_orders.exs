defmodule Benefits.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :total, :float, default: 0.00
      add :user_id, references(:users, type: :uuid, on_delete: :delete_all)

      timestamps()
    end

    create index(:orders, [:user_id])
  end
end
