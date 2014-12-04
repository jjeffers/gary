defmodule Gary.Mixfile do
  use Mix.Project

  def project do
    [app: :gary,
     version: "0.0.1",
     elixir: "~> 1.0",
     elixirc_paths: ["lib", "web"],
     compilers: [:phoenix] ++ Mix.compilers,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [mod: {Gary, []},
     applications: [:phoenix, :cowboy, :logger]]
  end

  # Specifies your project dependencies
  #
  # Type `mix help deps` for examples and options
  defp deps do
    [{:phoenix, github: "phoenixframework/phoenix"},
     {:cowboy, "~> 1.0"},
     { :json,   "~> 0.3.0"},
     {:ibrowse, github: "cmullaparthi/ibrowse", tag: "v4.1.0"},
     {:httpotion, "~> 0.2.0"}]
  end
end
