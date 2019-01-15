defmodule ScholarMath do
  defmacro draw({:+, _meta, [lhs, rhs]}) do
    IO.puts "In macro's context (#{__MODULE__})."

    quote do
      IO.puts "In caller's context (#{__MODULE__})."

      IO.puts """
        #{unquote(lhs)}
      + #{unquote(rhs)}
        --
        #{unquote(lhs+rhs)}
      """
    end
  end
end
