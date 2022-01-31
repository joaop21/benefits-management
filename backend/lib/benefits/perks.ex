defmodule Benefits.Perks do
  @moduledoc """
  The Perks context.
  """

  import Ecto.Query, warn: false
  alias Benefits.Repo

  alias Benefits.Perks.Product

  @doc """
  Returns the list of products.

  ## Examples

      iex> list_products()
      [%Product{}, ...]

  """
  def list_products do
    Repo.all(Product)
  end

  @doc """
  Given a list of identifiers, returns the
  products that match those list.

  ## Examples

      iex> list_products_by_identifiers(["product1",..])
      [%Product{}, ...]

  """
  def list_products_by_identifiers(identifiers) when is_list(identifiers) do
    Product
    |> where([p], p.identifier in ^identifiers)
    |> Repo.all()
    |> (&{:ok, &1}).()
  end

  def list_products_by_identifiers(_identifiers), do: {:error, "Argument isn't a list"}

  @doc """
  Creates a product.

  ## Examples

      iex> create_product(%{field: value})
      {:ok, %Product{}}

      iex> create_product(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_product(attrs \\ %{}) do
    %Product{}
    |> Product.changeset(attrs)
    |> Repo.insert()
  end

  alias Benefits.Perks.Order

  @doc """
  Creates a order.

  ## Examples

      iex> create_order(%{field: value})
      {:ok, %Order{}}

      iex> create_order(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_order(products_identifiers, user_id) do
    %Order{}
    # |> Order.changeset(attrs)
    |> Repo.insert()

    # with identifiers = Enum.uniq(products_identifiers),
    #     {:ok, products} <- list_products_by_identifiers(identifiers),

    # do
    # end
  end
end
