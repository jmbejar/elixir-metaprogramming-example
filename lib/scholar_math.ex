defmodule ScholarMath do
  defmacro draw({operator, _meta, [lhs, rhs]}) do
    quote do
      draw_math(unquote(operator), unquote(lhs), unquote(rhs))
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
