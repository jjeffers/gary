use Mix.Config

config :phoenix, Gary.Router,
  http: [port: System.get_env("PORT") || 4001],
