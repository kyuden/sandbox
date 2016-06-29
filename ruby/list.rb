ary = [5,3,13,1,2,3]

lower = ary.find_all {|a| a < 4}
hight = ary - lower

# puts lower << 4 << hight

ary1 = [1,2,3]
ary2 = [1,2,3]
tmp1 = ary1.reverse.each_with_index.inject(0) {|result, (a, i)| result += a * 10**i }
tmp2 = ary2.reverse.each_with_index.inject(0) {|result, (a, i)| result += a * 10**i }
p (tmp1 + tmp2).to_s.chars.map(&:to_i)