defmodule BlogWeb.PostController do
  use BlogWeb, :controller

  alias Blog.{Repo, Posts, Posts.Post}

  def index(conn, _params) do
    posts = Repo.all(Post)
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
    case Posts.create_post(post) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post #{post.title} successfully created")
        |> redirect(to: Routes.post_path(conn, :show, post))

      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
