ARGV.replace(['./data.text'])
first_lines = gets.split(' ')
height   = first_lines[0].to_i
line_num = first_lines[1].to_i
side_line_num = first_lines[2].to_i

side_line_mappings = {}
side_line_num.times do
  side_line_details = gets.split(' ')
  line_w = side_line_details[0].to_i
  line_h = side_line_details[1].to_i
  next_line_h = side_line_details[2].to_i
  side_line_mappings.store([line_w-1, line_h], [line_w, next_line_h])
  side_line_mappings.store([line_w, next_line_h], [line_w-1, line_h])
end

origin = side_line_mappings.dup
line_num.times do |l_index|
  now = [l_index, 0]

  while now[1] < height do
		if side_line_mappings[now]
			now = side_line_mappings[now]
			side_line_mappings = origin.dup
			side_line_mappings.delete(now)
		else
			side_line_mappings = origin.dup
			now[1] += 1
		end
  end

  if now[0] == 0
  	puts l_index + 1
  	break
  end

  side_line_mappings = origin.dup
end

