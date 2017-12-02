# Exporter

Quickly import library

## Examples

```elixir

  defmodule MyModule do
    use Exporter, default: [a: 0, b: 1]

    def a, do: "a"
    def b(_), do: "b"
    def c, do: "c"

  end

  defmodule MyApp do
    use MyModule
    a()  # ok. default import
    b(1) # ok. default import
    c()  # error

    use MyModule, [c: 0]
    a()  # error
    b(1) # error
    c()  # ok
  end

  # allow override

  defmodule MyModule do

    use Exporter, default: [a: 0, b: 1]

    defmacro __using__(opt)  do
      ast = super(opt)
      quote do
        import Enum, only: [min: 1]
        unquote(ast)
      end
    end

  end

```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `exporter` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:exporter, "~> 0.1.0"}]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/exporter](https://hexdocs.pm/exporter).

