defmodule BenefitsWeb.OrderController do
  use BenefitsWeb, :controller

  alias Benefits.Perks
  alias Benefits.Perks.Order

  action_fallback BenefitsWeb.FallbackController

  def create(conn, %{"order" => order_params}) do
    with {:ok, %Order{} = order} <- Perks.create_order(order_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.order_path(conn, :show, order))
      |> render("show.json", order: order)
    end
  end
end
