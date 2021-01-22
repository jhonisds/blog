defmodule BlogWeb.PostController do
  use BlogWeb, :controller

  alias Blog.{Posts, Posts.Post, Repo}

  def index(conn, _params) do
    posts = Posts.list_posts()
    render(conn, "index.html", posts: posts)
  end

  def show(conn, %{"id" => id}) do
    post = Repo.get!(Post, id)
    render(conn, "show.html", post: post)
  end

  def new(conn, _params) do
    changeset = Post.changeset(%Post{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"post" => post}) do
    result =
      post
      |> Posts.create_post()

    case result do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post #{post.title} successfully created")
        |> redirect(to: Routes.post_path(conn, :show, post))

      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    post = Posts.get_post!(id)
    Posts.delete_post(post)

    conn
    |> put_flash(:info, "Post #{id} successfully deleted")
    |> redirect(to: Routes.post_path(conn, :index))
  end

  def update(conn, %{"id" => id, "post" => post_params}) do
    case Posts.update_post(id, post_params) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post #{post.title} successfully updated")
        |> redirect(to: Routes.post_path(conn, :show, post))

      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def edit(conn, %{"id" => id}) do
    post = Posts.get_post!(id)
    changeset = Post.changeset(post)
    render(conn, "edit.html", post: post, changeset: changeset)
  end
end
