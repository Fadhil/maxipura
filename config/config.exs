# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :cwms,
  ecto_repos: [Cwms.Repo]

# Configures the endpoint
config :cwms, CwmsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "gSjdrwS1/lAG0zUlyWoibot52A/zFQN7dRFs96nZ8+lbKsa1hcSLbzE646JsRXwC",
  render_errors: [view: CwmsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Cwms.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
