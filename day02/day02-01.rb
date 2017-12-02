hash = {}
sum = 0

File.readlines('input.txt').each_with_index{|k, i| hash[i] = k.split('	').map(&:to_i)}
hash.each_value{|k| sum = sum + (k.max - k.min)}

puts sum