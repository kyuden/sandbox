defmodule Recursion do
  def print_multiple_times(msg, n) when n <= 1 do
    print_val(n, msg)
  end

  def print_multiple_times(msg, n) do
    print_val(n, msg)
    print_multiple_times(msg, n - 1)
  end

  defp print_val(n, msg) do
    IO.puts "#{n} #{msg}"
  end
end

Recursion.print_multiple_times("hello", 10)

defmodule Math do
  def sum_list([head|tail], accumulator) do
    sum_list(tail, head + accumulator)
  end

  def sum_list([], accumulator) do
    accumulator
  end

  def double_each(list) do
    double_each(list, [])
  end

  def double_each([head|tail], acc) do
    double_each(tail, [head * 2 | acc ])
  end

  def double_each([], acc) do
    acc
  end
end

IO.puts Math.sum_list([1,2,3], 0)
IO.puts Math.double_each([1, 2, 3])

IO.puts Enum.reduce([1,2,3], 0, &+/2)
IO.puts Enum.map([1,2,3], &(&1 * 2))
