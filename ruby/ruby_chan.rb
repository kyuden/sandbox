STDOUT.puts STDIN.gets.split().inject(Rational(0)) {|result, num| Rational(num) + result }

