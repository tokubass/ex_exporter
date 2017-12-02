defmodule Exporter.Mixfile do
  use Mix.Project

  def project do
    [app: :exporter,
     version: "0.1.0",
     elixir: "~> 1.4",
     description: "On the library side, you can specify functions and macros that the caller can use by default",
     package: [
       maintainers: ["tokubass"],
       licenses: ["This library is free software"],
       links: %{"GitHub" => "https://github.com/tokubass/ex_exporter"}
     ],

     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger]]
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
    [{:ex_doc, ">= 0.0.0", only: :dev}]
  end
end
