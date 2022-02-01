defmodule Benefits.PerksTest do
  use Benefits.DataCase

  alias Benefits.Perks

  describe "products" do
    alias Benefits.Perks.Product

    @valid_attrs %{identifier: "some identifier", name: "some name", price: 120.5}

    def product_fixture(attrs \\ %{}) do
      {:ok, product} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Perks.create_product()

      product
    end

    test "create_product/1 with valid data creates a product" do
      attrs = %{identifier: "create_identifier", name: "create_name", price: 120.5}

      assert {:ok, %Product{} = product} = Perks.create_product(attrs)
      assert product.identifier == "create_identifier"
      assert product.name == "create_name"
      assert product.price == 120.5
    end

    test "create_product/1 with invalid identifier returns error changeset" do
      invalid_attrs = %{identifier: nil, name: "invalid_name", price: 5.0}
      assert {:error, %Ecto.Changeset{}} = Perks.create_product(invalid_attrs)
    end

    test "create_product/1 with duplicated identifier returns error changeset" do
      attrs = %{identifier: "duplicated_identifier", name: "duplicated_name", price: 120.5}
      assert {:ok, %Product{}} = Perks.create_product(attrs)
      assert {:error, %Ecto.Changeset{}} = Perks.create_product(attrs)
    end

    test "create_product/1 with invalid name returns error changeset" do
      invalid_attrs = %{identifier: "invalid_identifier", name: nil, price: 5.0}
      assert {:error, %Ecto.Changeset{}} = Perks.create_product(invalid_attrs)
    end

    test "create_product/1 with invalid price returns error changeset" do
      invalid_attrs = %{identifier: "invalid_identifier", name: "invalid_name", price: -5.0}
      assert {:error, %Ecto.Changeset{}} = Perks.create_product(invalid_attrs)
    end

    test "list_products/0 returns all products" do
      assert Perks.list_products() == []

      product1 = product_fixture(%{identifier: "product1", name: "Product1", price: 120.5})
      product2 = product_fixture(%{identifier: "product2", name: "Product2", price: 12.5})
      product3 = product_fixture(%{identifier: "product3", name: "Product3", price: 1.5})
      product4 = product_fixture(%{identifier: "product4", name: "Product4", price: 0.5})
      product5 = product_fixture(%{identifier: "product5", name: "Product5", price: 0.1})

      products = Perks.list_products()

      assert is_list(products)
      assert product1 in products
      assert product2 in products
      assert product3 in products
      assert product4 in products
      assert product5 in products
    end
  end

  """
  describe "orders" do
    alias Benefits.Perks.Order

    @valid_attrs %{total: 120.5}
    @update_attrs %{total: 456.7}
    @invalid_attrs %{total: nil}

    def order_fixture(attrs \\ %{}) do
      {:ok, order} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Perks.create_order()

      order
    end

    test "list_orders/0 returns all orders" do
      order = order_fixture()
      assert Perks.list_orders() == [order]
    end

    test "get_order!/1 returns the order with given id" do
      order = order_fixture()
      assert Perks.get_order!(order.id) == order
    end

    test "create_order/1 with valid data creates a order" do
      assert {:ok, %Order{} = order} = Perks.create_order(@valid_attrs)
      assert order.total == 120.5
    end

    test "create_order/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Perks.create_order(@invalid_attrs)
    end

    test "update_order/2 with valid data updates the order" do
      order = order_fixture()
      assert {:ok, %Order{} = order} = Perks.update_order(order, @update_attrs)
      assert order.total == 456.7
    end

    test "update_order/2 with invalid data returns error changeset" do
      order = order_fixture()
      assert {:error, %Ecto.Changeset{}} = Perks.update_order(order, @invalid_attrs)
      assert order == Perks.get_order!(order.id)
    end

    test "delete_order/1 deletes the order" do
      order = order_fixture()
      assert {:ok, %Order{}} = Perks.delete_order(order)
      assert_raise Ecto.NoResultsError, fn -> Perks.get_order!(order.id) end
    end

    test "change_order/1 returns a order changeset" do
      order = order_fixture()
      assert %Ecto.Changeset{} = Perks.change_order(order)
    end
  end

  describe "order_lines" do
    alias Benefits.Perks.OrderLine

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def order_line_fixture(attrs \\ %{}) do
      {:ok, order_line} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Perks.create_order_line()

      order_line
    end

    test "list_order_lines/0 returns all order_lines" do
      order_line = order_line_fixture()
      assert Perks.list_order_lines() == [order_line]
    end

    test "get_order_line!/1 returns the order_line with given id" do
      order_line = order_line_fixture()
      assert Perks.get_order_line!(order_line.id) == order_line
    end

    test "create_order_line/1 with valid data creates a order_line" do
      assert {:ok, %OrderLine{} = order_line} = Perks.create_order_line(@valid_attrs)
    end

    test "create_order_line/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Perks.create_order_line(@invalid_attrs)
    end

    test "update_order_line/2 with valid data updates the order_line" do
      order_line = order_line_fixture()
      assert {:ok, %OrderLine{} = order_line} = Perks.update_order_line(order_line, @update_attrs)
    end

    test "update_order_line/2 with invalid data returns error changeset" do
      order_line = order_line_fixture()
      assert {:error, %Ecto.Changeset{}} = Perks.update_order_line(order_line, @invalid_attrs)
      assert order_line == Perks.get_order_line!(order_line.id)
    end

    test "delete_order_line/1 deletes the order_line" do
      order_line = order_line_fixture()
      assert {:ok, %OrderLine{}} = Perks.delete_order_line(order_line)
      assert_raise Ecto.NoResultsError, fn -> Perks.get_order_line!(order_line.id) end
    end

    test "change_order_line/1 returns a order_line changeset" do
      order_line = order_line_fixture()
      assert %Ecto.Changeset{} = Perks.change_order_line(order_line)
    end
  end
  """
end
