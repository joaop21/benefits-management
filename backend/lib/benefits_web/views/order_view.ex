defmodule BenefitsWeb.OrderView do
  use BenefitsWeb, :view
  alias BenefitsWeb.OrderView

  def render("index.json", %{orders: orders}) do
    %{data: render_many(orders, OrderView, "order.json")}
  end

  def render("show.json", %{order: order}) do
    %{order: render_one(order, OrderView, "order.json")}
  end

  def render("order.json", %{order: order}) do
    %{
      order_id: order.order_id,
      total: order.total,
      items: order.items
    }
  end
end
