# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :docknix,
  ecto_repos: [Docknix.Repo]

# Configures the endpoint
config :docknix, DocknixWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "luz+J9fpAgL3fwX3MfBZpytMGg/79GkXT1Y4O9cmIp2NI1zufQ6545p6Or61E4Xf",
  render_errors: [view: DocknixWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Docknix.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
