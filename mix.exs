defmodule Goth.Mixfile do
  use Mix.Project

  def project do
    [
      app: :goth,
      version: "1.2.0",
      description: description(),
      package: package(),
      elixirc_paths: elixirc_paths(Mix.env()),
      elixirc_options: [warnings_as_errors: true],
      elixir: "~> 1.4",
      deps: deps()
    ]
  end

  def application do
    [
      mod: {Goth, []}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:joken, "~> 2.0"},
      {:jason, "~> 1.1"},
      {:httpoison, "~> 0.11 or ~> 1.0"},
      {:bypass, "~> 1.0", only: :test},
      {:plug_cowboy, "~> 2.0", only: :test},
      {:mix_test_watch, "~> 1.0", only: :dev},
      {:ex_doc, "~> 0.19", only: :dev},
      {:credo, "~> 1.0", only: [:test, :dev]},
      {:dialyxir, "~> 1.0", only: [:dev], runtime: false}
    ]
  end

  defp description do
    """
    A simple library to generate and retrieve Oauth2 tokens for use with Google Cloud Service accounts.
    """
  end

  defp package do
    [
      maintainers: ["Phil Burrows"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/peburrows/goth"}
    ]
  end
end
