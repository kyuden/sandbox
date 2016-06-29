POLES = ["start", "goal", "temp"]

def hanoi(n, from=POLES[0], to=POLES[1])
  temp = (POLES - [from, to])[0]
  return if n == 0
  hanoi(n-1, from, temp)
  puts "Move #{n} #{from} => #{to}"
  hanoi(n-1, temp, to)
end

if __FILE__ == $0
  hanoi(2)
end