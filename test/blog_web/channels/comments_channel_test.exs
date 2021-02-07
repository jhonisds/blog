defmodule BlogWeb.CommentsChannelTest do
  use BlogWeb.ChannelCase

  alias Blog.Posts
  alias BlogWeb.UserSocket

  @valid_attrs %{title: "Phoenix", description: "Description Phoenix"}

  test "should be connect to socket" do
    {:ok, post} = Posts.create_post(@valid_attrs)
    {:ok, socket} = connect(UserSocket, %{})

    {:ok, result, socket} = subscribe_and_join(socket, "comments:#{post.id}", %{})

    assert post.id == socket.assigns.post_id
    assert [] == result.comments

    # IO.inspect(result)
  end
end
