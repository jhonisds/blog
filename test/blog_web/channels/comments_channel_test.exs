defmodule BlogWeb.CommentsChannelTest do
  use BlogWeb.ChannelCase

  alias Blog.Posts
  alias BlogWeb.UserSocket

  @valid_attrs %{title: "Phoenix", description: "Description Phoenix"}

  setup do
    {:ok, post} = Posts.create_post(@valid_attrs)
    {:ok, socket} = connect(UserSocket, %{})

    {:ok, socket: socket, post: post}
  end

  test "should be connect to socket", %{socket: socket, post: post} do
    {:ok, result, socket} = subscribe_and_join(socket, "comments:#{post.id}", %{})

    assert post.id == socket.assigns.post_id
    assert [] == result.comments
  end

  test "create a new comment", %{socket: socket, post: post} do
    {:ok, _result, socket} = subscribe_and_join(socket, "comments:#{post.id}", %{})

    ref = push(socket, "comment:add", %{"content" => "abcd"})

    msg = %{comment: %{content: "abcd"}}
    assert_reply ref, :ok, %{}
    broadcast_event = "comments:#{post.id}:new"
    assert_broadcast broadcast_event, msg
    refute is_nil(msg)
  end
end
