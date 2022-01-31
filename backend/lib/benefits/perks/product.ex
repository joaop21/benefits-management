defmodule Benefits.Perks.Product do
  use Ecto.Schema
  import Ecto.Changeset

  alias Benefits.Accounts.User
  alias Benefits.Perks.Order

  schema "products" do
    field :identifier, :string
    field :name, :string
    field :price, :float, default: 0.00

    many_to_many :users, User, join_through: "users_products"
    many_to_many :orders, Order, join_through: "orders_products"

    timestamps()
  end

  @doc false
  def changeset(%__MODULE__{} = product, attrs) do
    product
    |> cast(attrs, [:identifier, :name, :price])
    |> validate_required([:identifier, :name, :price])
    |> unique_constraint(:identifier)
    |> check_constraint(:price,
      name: :price_must_be_non_negative,
      message: "Price must be non-negative"
    )
  end
end
