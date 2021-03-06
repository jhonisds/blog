defmodule BlogWeb.PostControllerTest do
  use BlogWeb.ConnCase

  alias Blog.Posts

  @valid_attrs %{title: "Phoenix", description: "Description Phoenix"}
  @update_attrs %{title: "Update", description: "Description Update"}
  @invalid_attrs %{title: nil, description: nil}

  def post_fixtures(attrs \\ %{}) do
    {:ok, post} = Posts.create_post(@valid_attrs)
    post
  end

  def create_post(_) do
    %{post: post_fixtures(:post)}
  end

  test "display the posts", %{conn: conn} do
    Posts.create_post(@valid_attrs)

    conn = get(conn, Routes.post_path(conn, :index))
    assert html_response(conn, 200) =~ "Phoenix"
  end

  test "get post by id", %{conn: conn} do
    {:ok, post} = Posts.create_post(@valid_attrs)

    conn = get(conn, Routes.post_path(conn, :show, post))
    assert html_response(conn, 200) =~ "Phoenix"
  end

  test "displays the form", %{conn: conn} do
    conn = get(conn, Routes.post_path(conn, :new))
    assert html_response(conn, 200) =~ "Create post"
  end

  test "with valid data creates a post", %{conn: conn} do
    conn = post(conn, Routes.post_path(conn, :create), post: @valid_attrs)

    assert %{id: id} = redirected_params(conn)
    assert redirected_to(conn) == Routes.post_path(conn, :show, id)

    conn = get(conn, Routes.post_path(conn, :show, id))
    assert = html_response(conn, 200) =~ "Phoenix"
  end

  test "with invalid data creates a post", %{conn: conn} do
    conn = post(conn, Routes.post_path(conn, :create), post: %{})

    assert html_response(conn, 200) =~ "can&#39;t be blank"
  end

  describe "with created post" do
    setup [:create_post]

    test "displays form to updates a post", %{conn: conn, post: post} do
      conn = get(conn, Routes.post_path(conn, :edit, post))
      assert html_response(conn, 200) =~ "Edit post"
    end

    test "with valid data updates the post", %{conn: conn, post: post} do
      conn = put(conn, Routes.post_path(conn, :update, post), post: @update_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.post_path(conn, :show, id)

      conn = get(conn, Routes.post_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Update"
    end

    test "with invalid data updates the post", %{conn: conn, post: post} do
      conn = put(conn, Routes.post_path(conn, :update, post), post: @invalid_attrs)

      assert html_response(conn, 200) =~ "can&#39;t be blank"
    end

    test "deletes the posts", %{conn: conn, post: post} do
      conn = delete(conn, Routes.post_path(conn, :delete, post))
      assert redirected_to(conn) == Routes.post_path(conn, :index)

      assert_error_sent 404, fn -> get(conn, Routes.post_path(conn, :show, post)) end
    end
  end
end
