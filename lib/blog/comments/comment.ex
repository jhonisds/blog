defmodule Blog.Comments.Comment do
  @moduledoc """
  Documentation for Schema Comments
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias Blog.Posts.Post

  @derive {Jason.Encoder, only: [:content]}
  schema "comments" do
    field :content, :string

    belongs_to :post, Post
    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:content])
    |> validate_required([:content])
  end
end
