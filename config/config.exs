# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :blog,
  ecto_repos: [Blog.Repo]

# Configures the endpoint
config :blog, BlogWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "/Iw8QbCb3/HZ5uSFQdZGpu4SuaYsk298TItlj2xz3Obn1estfeQZ5yPtkjLpCZJJ",
  render_errors: [view: BlogWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Blog.PubSub,
  live_view: [signing_salt: "5eadPIFe"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
