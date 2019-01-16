defmodule ScholarMath do
  defmacro __using__(_options) do
    quote do
      import unquote(__MODULE__)

      @functions []

      @before_compile unquote(__MODULE__)
    end
  end

  defmacro draw({operator, _meta, [lhs, rhs]}) do
    function_name = String.to_atom(
      "draw " <> Atom.to_string(operator) <> Integer.to_string(lhs) <> Integer.to_string(rhs)
    )

    quote do
      @functions [unquote(function_name) | @functions]

      def unquote(function_name)() do
        draw_math(unquote(operator), unquote(lhs), unquote(rhs))
      end
    end
  end

  defmacro __before_compile__(_env) do
    quote do
      def run do
        Enum.each @functions, fn name ->
          IO.puts "Running #{name}"
          apply(__MODULE__, name, [])
        end
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
