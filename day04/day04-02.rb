p File.readlines('input.txt').select{|k| b=k.split(' '); b.count == b.map{|l| l.chars.sort}.uniq.count}.count
