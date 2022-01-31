defmodule Benefits.Perks.Order do
  use Ecto.Schema
  import Ecto.Changeset

  alias Benefits.Accounts.User

  schema "orders" do
    field :total, :float

    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(%__MODULE__{} = order, attrs) do
    order
    |> cast(attrs, [:user_id, :total])
    |> validate_required([:user_id, :total])
  end
end
