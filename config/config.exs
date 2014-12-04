# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the router
config :phoenix, Gary.Router,
  url: [host: "localhost"],
  http: [port: System.get_env("PORT")],
  secret_key_base: "HJSqtwudh5aOBBslE4wrPSJwFBAsuXV1oIGDBNfxJCoSqf0hSc5XKSH4NSkCui9yn0hADs/TosHOPXyTdOQYTg==",
  debug_errors: false,
  error_controller: Gary.PageController

# Session configuration
config :phoenix, Gary.Router,
  session: [store: :cookie,
            key: "_gary_key"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
