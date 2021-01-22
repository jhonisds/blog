defmodule Blog.Posts do
  @moduledoc """
  The `Posts` context.
  """

  alias Blog.{Posts.Post, Repo}

  @doc """
  Gets a single post.

  ## Examples

      iex> get_post!(123)
      [%Post{}, ...]

      iex> get_post!(999)
      ** (Ecto.NoResultsError)

  """
  def get_post!(id), do: Repo.get!(Post, id)

  @doc """
  Returns the list of posts.

  ## Examples

      iex> list_posts()
      [%Post{}, ...]

  """
  def list_posts, do: Repo.all(Post)

  @doc """
  Creates a post.

  ## Examples

      iex> create_post(%{field: value})
      {:ok, %Post{}}

      iex> create_post(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """

  def create_post(attrs \\ %{}) do
    %Post{}
    |> Post.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Deletes a post.

  ## Examples

      iex> delete_post(post)
      {:ok, %Post{}}

      iex> delete_post(post)
      {:error, %Ecto.Changeset{}}

  """
  def delete_post(%Post{} = post), do: Repo.delete(post)

  @doc """
  Updates a post.

  ## Examples

      iex> update_post(%{field: new_value})
      {:ok, %Post{}}

      iex> update_post(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_post(id, attrs) do
    get_post!(id)
    |> Post.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking post changes.

  ## Examples

      iex> change_post(post)
      {:ok, %Post{}}

  """
  def change_post(%Post{} = post, attrs \\ %{}) do
    Post.changeset(post, attrs)
  end
end
