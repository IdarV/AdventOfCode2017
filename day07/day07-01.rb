@hash = {}
found = false

data = File.readlines('input.txt').map(&:strip).each{|h| @hash[h.split(' (')[0]] = h.include?('->') ? h.split('-> ')[1].split(', ').to_s : []}

parent = @hash.each_key.find{|k| @hash[k] == []}
until found
    next_parent = @hash.each_key.find{|k| @hash[k].include?(parent)}
    found = true if next_parent.nil?
    parent = next_parent unless found
end

puts parent
