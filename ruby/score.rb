ARGV.replace(['./data.text'])

first_lines = gets.split(' ')
people_num  = first_lines[0].to_i
lines_num   = first_lines[1].to_i

if lines_num < 0 || lines_num < 0
  puts 0
else
	results = []
	lines_num.times do
		results << gets.split(' ').inject(0) {|sum, n| sum + n.to_i }
	end
	benefit = results.find_all {|num| num > 0 }.inject(0) {|sum, num| sum + num }
	puts benefit > 0 ? benefit : 0
end
