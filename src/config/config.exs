# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :invo,
  ecto_repos: [Invo.Repo]

# Configures the endpoint
config :invo, InvoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "csWoMvpt/ttA6VK+6MkdJAZqqLqsqplaN2NXtr0Hh7E1aJWvZMGegwvsPIioezVt",
  render_errors: [view: InvoWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Invo.PubSub,
  live_view: [signing_salt: "ev5C1pIp"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
