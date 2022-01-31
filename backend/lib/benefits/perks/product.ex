defmodule Benefits.Perks.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :identifier, :string
    field :name, :string
    field :price, :float, default: 0.00

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
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