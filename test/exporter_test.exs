defmodule My do

  use Exporter, default: [a: 0, b: 1]
  def a, do: "a"
  def b(_), do: "b"
  def c, do: "c"

end

defmodule ExporterTest do
  use ExUnit.Case
  doctest Exporter

  test "default_export" do
    use My
    assert "a" == a()
    assert "b" == b(1)

    use My, [c: 0]
    assert "c" == c()
   end
end
