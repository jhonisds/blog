defmodule BlogWeb.CommentsChannel do
  use BlogWeb, :channel

  alias Blog.{Comments, Posts}

  def join("comments:" <> post_id, _payload, socket) do
    post = Posts.get_post_with_comments!(post_id)
    {:ok, %{comments: post.comments}, assign(socket, :post_id, post.id)}
  end

  def handle_in("comment:add", content, socket) do
    response =
      socket.assigns.post_id
      |> Comments.create_comment(content)

    IO.inspect(response)

    case response do
      {:ok, comment} ->
        {:reply, :ok, socket}

      {:error, changeset} ->
        {:reply, {:error, %{errors: changeset}}}
    end
  end
end
