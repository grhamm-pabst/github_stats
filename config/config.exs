# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :github_stats,
  ecto_repos: [GithubStats.Repo]

config :github_stats, GithubStatsWeb.Auth.Pipeline,
  module: GithubStatsWeb.Auth.Guardian,
  error_handler: GithubStatsWeb.Auth.ErrorHandler

config :github_stats, GithubStats.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

config :github_stats, GithubStatsWeb.Auth.Guardian,
  issuer: "github_stats",
  secret_key: "qdY+SRR9psVBpb4usmMY6F5nvXCPcL3zGOEj1z0sznRydI5goDUpDsldeCb6hhEU"

# Configures the endpoint
config :github_stats, GithubStatsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "BQIGdft8hZqD3kofuaEPxy3XlhyXPlP7JiY4vQnpBkDRAP0kETR/PZ6Hl6lh1IHq",
  render_errors: [view: GithubStatsWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: GithubStats.PubSub,
  live_view: [signing_salt: "uVRVaaq/"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
