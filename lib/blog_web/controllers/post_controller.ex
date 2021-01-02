defmodule BlogWeb.PostController do
  use BlogWeb, :controller

  def index(conn, _params) do
    posts = [
      %{id: 1, title: "Phoenix"},
      %{id: 2, title: "LiveView"},
      %{id: 3, title: "Postgres"}
    ]

    render(conn, "index.html", posts: posts)
  end

  def show(conn, _params) do
    render(conn, "show.html")
  end
end
