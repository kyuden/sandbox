atr = [[1,2,3],[4,5,6],[7,8,9]]
result = []
atr.size.times do |i|
  key = "@new_low_#{i}"
  eval("#{key} = []")
end

atr.each do |low|
 low.each_with_index do |image, i|
	key = "@new_low_#{i}"
 	eval("#{key} << image")
 end
end

atr.size.times do |i|
	key = "@new_low_#{i}"
  eval("result << #{key}")
end

n = 180
(n / 90).times do |_|
 atr = atr.transpose.each {|low| low.reverse! }
end
p atr