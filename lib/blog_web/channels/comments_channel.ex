defmodule BlogWeb.CommentsChannel do
  use BlogWeb, :channel

  alias Blog.Posts

  def join("comments:" <> post_id, payload, socket) do
    # IO.inspect(post_id, label: "ID")
    # IO.inspect(payload, label: "PAYLOAD")
    # IO.inspect(socket, label: "SOCKET")

    post = Posts.get_post_with_comments!(post_id)

    IO.inspect(post.comments)

    {:ok, %{comments: post.comments}, socket}
  end

  def handle_in() do
  end
end
