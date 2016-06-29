require 'benchmark'


def fibonacchi(n)
  fary = [0,1]

	if n == 0 || n == 1
		fary[n]
	else
		(n - 1).times do |n|
			fary.push(fary[n] + fary[n+1])
		end
		fary.last
	end
end

Benchmark.bm 2 do |r|
	r.report "first" do
		puts fibonacchi(100000)
	end
end


# if __FILE__ == $0
# 	puts fibonacchi(10)
# end