defmodule BenefitsWeb.ProductController do
  @moduledoc """
  Contains the controller functions that respond to specific endpoints related to products resources.
  """

  use BenefitsWeb, :controller

  alias Benefits.Perks

  def index(conn, _params) do
    products = Perks.list_products()
    render(conn, "index.json", products: products)
  end
end
