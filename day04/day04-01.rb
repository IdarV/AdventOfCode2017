p File.readlines('input.txt').select{|k| b=k.split(' '); b.count == b.uniq.count }.count
