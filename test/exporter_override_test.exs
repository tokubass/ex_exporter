defmodule MyOverride do

  use Exporter, default: [a: 0, b: 1]

  defmacro __using__(opt)  do
    ast = super(opt)
    quote do
      import Enum, only: [min: 1]
      unquote(ast)
    end
  end


  def a, do: "a"
  def b(_), do: "b"
  def c, do: "c"

end

defmodule ExporterOverrideTest do
  use ExUnit.Case
  doctest Exporter

  test "default_export" do
    use MyOverride
    assert "a" == a()
    assert "b" == b(1)
    assert 3 = min([4,5,3])

    use My, [c: 0]
    assert "c" == c()
    assert 3 = min([4,5,3])
   end
end
