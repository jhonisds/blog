defmodule BlogWeb.CommentsChannel do
  use BlogWeb, :channel

  def join(name, _payload, socket), do: {:ok, %{name: "My channel"}, socket}

  def handle_in() do
  end
end
