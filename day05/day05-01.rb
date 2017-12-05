input = File.readlines('input.txt').map(&:to_i)
index = count = 0

until input[index].nil?
    nextIndex = index + input[index]
    input[index] = input[index] + 1
    index = nextIndex
    count = count + 1
end

p count
