defmodule Blog.Posts do
  @moduledoc """
  Documentation for `Posts` context.
  """
  alias Blog.{Posts.Post, Repo}

  def get_post!(id), do: Repo.get!(Post, id)

  def list_posts, do: Repo.all(Post)

  def create_post(attrs \\ %{}) do
    %Post{}
    |> Post.changeset(attrs)
    |> Repo.insert()
  end

  def delete_post(id) do
    get_post!(id)
    |> Repo.delete()
  end

  def update_post(id, attrs) do
    get_post!(id)
    |> Post.changeset(attrs)
    |> Repo.update()
  end
end
