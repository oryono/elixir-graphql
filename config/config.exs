# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :getaways,
  ecto_repos: [Getaways.Repo]

# Guardian config
config :getaways, Getaways.Guardian,
  issuer: "Getaways",
  secret_key: "lHcSDOaJvV/afPH7zZdtnNumEyqu87BknwUsq+tWekUXYUdLJ9Tco6jb7jM3+JYw"

# Configures the endpoint
config :getaways, GetawaysWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "PJhA8ABcFzRFyw1vf4dzuYWlHw8msZoUJK1STAPeU0FCgPUcf8U0la0EqU5yddof",
  render_errors: [view: GetawaysWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Getaways.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
