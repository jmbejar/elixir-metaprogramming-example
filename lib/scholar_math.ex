defmodule ScholarMath do
  defmacro __using__(_options) do
    quote do
      import unquote(__MODULE__)
    end
  end

  defmacro draw({operator, _meta, [lhs, rhs]}) do
    function_name = String.to_atom(
      "draw " <> Atom.to_string(operator) <> Integer.to_string(lhs) <> Integer.to_string(rhs)
    )

    quote do
      def unquote(function_name)() do
        draw_math(unquote(operator), unquote(lhs), unquote(rhs))
      end
    end
  end

  def draw_math(:+, lhs, rhs) do
    IO.puts """
        #{lhs}
      + #{rhs}
        --
        #{lhs+rhs}
      """
  end

  def draw_math(:*, lhs, rhs) do
    IO.puts """
        #{lhs}
      * #{rhs}
        --
        #{lhs*rhs}
      """
  end
end
