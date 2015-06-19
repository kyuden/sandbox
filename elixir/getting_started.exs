IO.puts 10 / 2 #=> 5.0

val = case {1,2,3} do
  {4,5,6} ->
    "ao"
  {1,x,3} ->
    x
  _ ->
    "aas"
end

IO.puts val

val2 = case 2 do
        3 ->
          "aaa"
         ^val when val > 3 ->
          "hogehoge"
         ^val ->
          "that's right !"
         _ ->
          "hogehoge"
       end

IO.puts val2

f = fn
      x, y when x > 0 -> x + y
      x, y -> x * y
    end

IO.puts f.(3,1)
IO.puts f.(-3,1)

cond do
  2 + 2 == 5 ->
    IO.puts "hoge"
  3 * 3 == 5 ->
    IO.puts "huga"
  1 + 1 == 2 ->
    IO.puts "that's right"
end

defmodule Math do
  def sum(a, b) do
    a + b
  end
end

IO.puts Math.sum(1,2)

defmodule Math do
  def zero?(0) do
    true
  end

  def zero?(x) when is_number(x) do
    false
  end
end



IO.puts Math.zero?(0)
IO.puts Math.zero?(1)



fun = &(&1 + 1)
IO.puts fun.(1)


defmodule DefaultTest do
  def dowork(x \\ IO.puts "hello") do
    x
  end
end

DefaultTest.dowork(3)
DefaultTest.dowork

defmodule DefaultTest2 do
  def join(a, b \\ nil, seq \\ "=")
  def join(a, b, _seq) when is_nil(b) do
    a
  end

  def join(a,b,seq) do
    a <> seq <> b
  end

end

IO.puts DefaultTest2.join("Hello", "world")
IO.puts DefaultTest2.join("Hello", "world", "_")
IO.puts DefaultTest2.join("Hello")







































