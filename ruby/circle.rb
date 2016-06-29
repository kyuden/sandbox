ary1 = [1,2,1]
p ary1[0..ary1.size%2]
p ary1[ary1.size%2..-1]
p ary1[0..ary1.size%2].reverse == ary1[ary1.size%2-1..-1]
