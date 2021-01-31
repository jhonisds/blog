defmodule Blog.Posts.Post do
  @moduledoc """
  Documentation for Schema Post
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias Blog.Comments.Comment

  schema "posts" do
    field :title, :string
    field :description, :string

    has_many :comments, Comment
    timestamps()
  end

  def changeset(post, attrs \\ %{}) do
    post
    |> cast(attrs, [:title, :description])
    |> validate_required([:title, :description])
  end
end
