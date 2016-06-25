str1 = "abcdefg"
str2 = "gabcdef"

def chars_same?(first, second)
	return false if first.size != second.size
	first.chars.sort == second.chars.sort
end

puts chars_same?(str1, str2)