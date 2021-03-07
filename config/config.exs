# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :votes,
  ecto_repos: [Votes.Repo]

# Configures the endpoint
config :votes, VotesWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "dZlkvvJ+/AN8XMbwcSZRrT6/0OYfN3sTWs9uoWY8Pd82oyowpeG4YjmbL3S4oqKg",
  render_errors: [view: VotesWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Votes.PubSub,
  live_view: [signing_salt: "okfpd/0O"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :votes, Votes.Guardian,
  issuer: "votes",
  secret_key: "HXuLpyLvAjOdUbIioDq4waNgjNe/Q2+GZdRG8RLzMd/AWDP9yfH3U45KfKeyPN6BQGc=",
  ttl: {3, :days}

config :votes, VotesWeb.AuthAccessPipeline,
  module: Votes.Guardian,
  error_handler: VotesWeb.AuthErrorHandler

config :waffle,
  storage: Waffle.Storage.S3, # or Waffle.Storage.Local
  bucket: System.get_env("AWS_BUCKET_NAME") # if using S3

# If using S3:
config :ex_aws,
  json_codec: Jason,
  access_key_id: System.get_env("AWS_ACCESS_KEY_ID"),
  secret_access_key: System.get_env("AWS_SECRET_ACCESS_KEY"),
  region: System.get_env("AWS_REGION")

config :votes, Votes.Mailer,
  adapter: Bamboo.MandrillAdapter,
  api_key: "my_api_key"

config :kaffy,
   otp_app: :votes,
   ecto_repo: Votes.Repo,
   router: VotesWeb.Router

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
