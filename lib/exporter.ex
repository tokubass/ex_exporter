defmodule Exporter do

  @moduledoc """
  Quickly import library
  """

  @doc """
  Quickly import library

      defmodule MyModule do

        use Exporter, default: [a: 0, b: 1]

        def a, do: "a"
        def b(_), do: "b"
        def c, do: "c"

      end

      defmodule MyApp do
        use MyModule
        a()  # ok
        b(1) # ok
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

  """

  defmacro __using__(exporter_opt) do
    default_export = Keyword.get(exporter_opt, :default, [])
    quote do

      defmacro __using__(only_list) do
        default_export = unquote(default_export)
        case Enum.empty?(only_list) do
          true ->
            quote do
              import unquote(__MODULE__), only: unquote(default_export)
            end
          false ->
            quote do
              import unquote(__MODULE__), only: unquote(only_list)
            end
        end
      end

      defoverridable [__using__: 1]
    end
  end

end
