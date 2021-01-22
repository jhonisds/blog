defmodule Blog.Posts.PostsTest do
  use Blog.DataCase

  alias Blog.{Posts, Posts.Post}

  @valid_attrs %{title: "Phoenix", description: "Description Phoenix"}
  @update_attrs %{title: "Elixir", description: "Description Elixir"}
  @invalid_attrs %{title: nil, description: nil}

  def post_fixtures(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(@valid_attrs)
      |> Posts.create_post()

    post
  end

  describe "post" do
    test "create_post/1 with valid data creates a post" do
      assert {:ok, %Post{} = post} = Posts.create_post(@valid_attrs)

      assert post.title === "Phoenix"
      assert post.description === "Description Phoenix"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Posts.create_post(@invalid_attrs)
    end

    test "list_posts/0 returns all posts" do
      post = post_fixtures()
      assert Posts.list_posts() == [post]
    end

    test "get_post/1 returns the post with given id" do
      post = post_fixtures()
      assert Posts.get_post!(post.id) == post
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixtures()

      assert {:ok, %Post{} = post} = Posts.update_post(post.id, @update_attrs)
      assert post.title == "Elixir"
      assert post.description == "Description Elixir"
    end

    test "update_post/2  with invalid data returns error changeset" do
      post = post_fixtures()
      assert {:error, %Ecto.Changeset{}} = Posts.update_post(post.id, @invalid_attrs)
      assert post == Posts.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixtures()
      assert {:ok, %Post{}} = Posts.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Posts.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixtures()
      assert %Ecto.Changeset{} = Posts.change_post(post)
    end
  end
end
