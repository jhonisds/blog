defmodule Blog.Posts do
  @moduledoc """
  Documentation for `Posts` context.
  """
  alias Blog.{Repo, Posts.Post}

  def create_post(attrs \\ %{}) do
    %Post{}
    |> Post.changeset(attrs)
    |> Repo.insert()
    |> IO.inspect(label: "CREATE ITEM")
  end
end
