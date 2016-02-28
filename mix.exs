defmodule FeatureToggler.Mixfile do
	use Mix.Project

	def project do
		[app: :feature_toggler,
			version: "0.0.1",
			elixir: "~> 1.2",
			description: description,
			package: package,
			build_embedded: Mix.env == :prod,
			start_permanent: Mix.env == :prod,
			deps: deps]
	end

	# Configuration for the OTP application
	#
	# Type "mix help compile.app" for more information
	def application do
		[applications: [:logger]]
	end

	defp description do
		"""
    This is a simple feature toggler/switch with redis database written in elixir.
		"""
	end

	defp package do
		[# These are the default files included in the package
			files: ["lib", "config", "mix.exs", "README*", "LICENSE*"],
			maintainers: ["Aravind Gopalakrishnan"],
			licenses: ["MIT License"],
			links: %{"GitHub" => "https://github.com/aravindgd/feature_toggler", "docs" => 'http://hexdocs.pm/feature_toggler/0.0.1/'}]
	end

	# Dependencies can be Hex packages:
	#
	#   {:mydep, "~> 0.3.0"}
	#
	# Or git/path repositories:
	#
	#   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
	#
	# Type "mix help deps" for more examples and options
	defp deps do
		[{:exredis, ">= 0.2.2"},
			{:earmark, "~> 0.1", only: :dev},
			{:ex_doc, "~> 0.11", only: :dev}]
	end
end
