defmodule GiphyScraper.MixProject do
  use Mix.Project

  def project do
    [
      app: :giphy_scraper,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      env: [giphy_api_key: System.get_env("GIPHY_API_KEY")],
      extra_applications: [:logger],
      mod: {GiphyScraper.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:finch, "~> 0.16"},
      {:jason, "~> 1.4"}
    ]
  end
end
