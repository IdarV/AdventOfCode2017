p File.readlines('input.txt').select{|k| b=k.split(" "); b.map{|k| k.split('').sort}.count == b.map{|k| k.split('').sort}.uniq.count }.count
