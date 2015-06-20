defmodule TrotExample.Mixfile do
  use Mix.Project

  def project do
    [app: :trot_example,
     version: "0.0.1",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger, :trot]]
  end

  defp deps do
    [{:trot, github: "hexedpackets/trot"}]
  end
end
