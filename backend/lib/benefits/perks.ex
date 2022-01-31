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

  alias Benefits.Perks.OrderLine

  @doc """
  Returns the list of order_lines.

  ## Examples

      iex> list_order_lines()
      [%OrderLine{}, ...]

  """
  def list_order_lines do
    Repo.all(OrderLine)
  end

  @doc """
  Gets a single order_line.

  Raises `Ecto.NoResultsError` if the Order line does not exist.

  ## Examples

      iex> get_order_line!(123)
      %OrderLine{}

      iex> get_order_line!(456)
      ** (Ecto.NoResultsError)

  """
  def get_order_line!(id), do: Repo.get!(OrderLine, id)

  @doc """
  Creates a order_line.

  ## Examples

      iex> create_order_line(%{field: value})
      {:ok, %OrderLine{}}

      iex> create_order_line(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_order_line(attrs \\ %{}) do
    %OrderLine{}
    |> OrderLine.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a order_line.

  ## Examples

      iex> update_order_line(order_line, %{field: new_value})
      {:ok, %OrderLine{}}

      iex> update_order_line(order_line, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_order_line(%OrderLine{} = order_line, attrs) do
    order_line
    |> OrderLine.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a order_line.

  ## Examples

      iex> delete_order_line(order_line)
      {:ok, %OrderLine{}}

      iex> delete_order_line(order_line)
      {:error, %Ecto.Changeset{}}

  """
  def delete_order_line(%OrderLine{} = order_line) do
    Repo.delete(order_line)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking order_line changes.

  ## Examples

      iex> change_order_line(order_line)
      %Ecto.Changeset{data: %OrderLine{}}

  """
  def change_order_line(%OrderLine{} = order_line, attrs \\ %{}) do
    OrderLine.changeset(order_line, attrs)
  end
end
