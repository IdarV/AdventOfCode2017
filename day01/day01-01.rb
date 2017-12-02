input = File.read('input.txt')

next_increment = 1
max_length = input.length
matches = 0

input.each_char.with_index{|s, i| matches = matches + s.to_i if s == input[(i + next_increment) % max_length] }

puts matches
