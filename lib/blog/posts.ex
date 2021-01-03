defmodule Blog.Posts do
  @moduledoc """
  Documentation for `Posts` context.
  """
  alias Blog.{Posts.Post, Repo}

  def create_post(attrs \\ %{}) do
    %Post{}
    |> Post.changeset(attrs)
    |> Repo.insert()
  end
end
