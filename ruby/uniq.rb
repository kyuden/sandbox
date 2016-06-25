atr = []

p "ununiq" if "abcdefa".chars.uniq!

"abcdefa".each_char do |str|
	puts str and return if atr.include?(str)
	atr.push(str)
end
