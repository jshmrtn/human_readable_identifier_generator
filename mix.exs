defmodule HumanReadableIdentifierGenerator.MixProject do
  @moduledoc false

  use Mix.Project

  def project do
    [
      app: :human_readable_identifier_generator,
      version: "1.0.0",
      description: description(),
      package: package(),
      elixir: "~> 1.11",
      test_coverage: [tool: ExCoveralls],
      dialyzer: [
        plt_add_apps: [:mix]
      ],
      deps: deps(),
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.html": :test,
        "coveralls.json": :test,
        "coveralls.post": :test,
        "coveralls.xml": :test
      ],
      dialyzer:
        [plt_add_apps: [:ecto]] ++
          if (System.get_env("DIALYZER_PLT_PRIV") || "false") in ["1", "true"] do
            [plt_file: {:no_warn, "priv/plts/dialyzer.plt"}]
          else
            []
          end
    ]
  end

  def application do
    [
      mod: {HumanReadableIdentifierGenerator.Application, []},
      extra_applications: [:logger]
    ]
  end

  defp description do
    """
    Present ID's to humans that are readable and writeable.
    """
  end

  defp package do
    [
      name: :human_readable_identifier_generator,
      files: ["lib", "mix.exs", "README*", "CHANGELOG.md", "LICENSE*", "priv/data/prod/*.dets"],
      maintainers: ["Jonatan Männchen"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/jshmrtn/human_readable_identifier_generator"}
    ]
  end

  defp deps do
    [
      {:unidecode, "~> 1.0.1", only: [:dev, :test]},
      {:credo, "~> 1.4", runtime: false, only: [:dev]},
      {:dialyxir, "~> 1.0", runtime: false, only: [:dev]},
      {:ex_doc, "~> 0.19", runtime: false, only: [:dev]},
      {:excoveralls, "~> 0.4", runtime: false, only: [:test]}
    ]
  end
end
