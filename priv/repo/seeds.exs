# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Blog.Repo.insert!(%Blog.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Blog.Posts

posts = [
  %{title: "Phoenix", description: "Description Phoenix"},
  %{title: "LiveView", description: "Description LiveView"},
  %{title: "Postgres", description: "Description Postegres"},
  %{title: "Elixir", description: "Description Elixir"}
]

Enum.each(posts, &Posts.create_post/1)
