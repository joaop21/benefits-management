defmodule BenefitsWeb.OrderController do
  use BenefitsWeb, :controller

  alias Benefits.Perks
  alias Benefits.Perks.Order

  action_fallback BenefitsWeb.FallbackController

  def create(conn, %{"order" => %{"items" => identifiers, "user_id" => user_id}}) do
    with {:ok, %Order{} = order} <- Perks.create_order(identifiers, user_id) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.order_path(conn, :show, order))
      |> render("show.json", order: order)
    end
  end
end
