data = File.read('input.txt').split('	').map(&:to_i)
history = []
found = false

def distribute (data, index, value)
  value.times do
    index = index + 1
    index = index - data.length if index >= data.length
    data[index] = data[index] + 1
  end

  data
end

until found
  highest_index = data.index(data.max)
  value = data[highest_index]
  data[highest_index] = 0

  data = distribute(data, highest_index, value)
  found = true if history.include? data.to_s
  history << data.to_s
end
puts history.size
