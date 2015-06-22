import IO

defmodule User do
  defstruct name: "john", age: 27
end

defprotocol Blank do
  def blank?(data)
end

defimpl Blank, for: Integer do
  def blank?(_), do: false
end

defimpl Blank, for: List do
  def blank?([]), do: true
  def blank?(_), do: false
end

defimpl Blank, for: Map do
  def blank?(map), do: map_size(map) == 0
end

defimpl Blank, for: Atom do
  def blank?(false), do: true
  def blank?(nil), do: true
  def blank?(_), do: false
end

puts Blank.blank?(0)
puts Blank.blank?([])
puts Blank.blank?([1,2,3])

defmodule Aaa do
@doc """
Converts double-quotes to single-quotes.

## Examples

    iex> convert("\\\"foo\\\"")
    "'foo'"

"""
def aaa do
  true
end

@doc ~S"""
Converts double-quotes to single-quotes.

## Examples

    iex> convert("\"foo\"")
    "'foo'"

"""
def bbb do
  true
end
end

h Aaa.aaa/0
h Aaa.bbb/0
