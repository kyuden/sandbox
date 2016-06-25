str = "aabcccccaaa"

new_str   = ""
prev_str  = str[0]
tmp_count = 1

str.each_char do |s|
	if s == prev_str
		tmp_count += 1
	else
	  new_str << prev_str + tmp_count.to_s
	  tmp_count = 1
	end
	prev_str = s
end
new_str << prev_str + tmp_count.to_s

new_str = str unless str.size > new_str.size

puts new_str