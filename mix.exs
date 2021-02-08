defmodule DistilleryExample.Mixfile do
  use Mix.Project

  def project do
    [
      app: :distillery_example,
      version: "0.1.0",
      elixir: "~> 1.10",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger], mod: {DistilleryExample.Application, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:distillery, "~> 2.1",
       warn_missing: false,
       git: "git@github.com:bitwalker/distillery.git",
       branch: "master",
       override: true},
      {:logflare_logger_backend, "0.8.0-rc.6"}
    ]
  end
end
