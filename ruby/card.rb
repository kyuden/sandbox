ARGV.replace(['./data.text'])

first_lines = gets.split(' ')
pocket_num = first_lines[0].to_i 
pocket_sum = pocket_num * 2
card_num = first_lines[1].to_i

first_num = ((card_num - 1) / pocket_sum) * pocket_sum + 1
end_num   = first_num + pocket_sum - 1
puts end_num - (card_num - first_num)