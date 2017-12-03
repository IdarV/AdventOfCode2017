odd = 1
found = false
input = File.read('input.txt').to_i

def smallest_dif(input, values)
  smallest_diff = (input - values[0]).abs
  closest = 0

  (1...values.length).each do |i|
    current_diff = (input - values[i]).abs
    if current_diff < smallest_diff
      smallest_diff = current_diff
      closest = i
    end
  end

  values[closest]
end

until found
  odd = odd + 2
  squared = odd*odd
  if squared >= input
    corners = [squared]
    3.times { corners.push(corners.last - odd + 1) }

    closest_corner = smallest_dif(input, corners)
    distance_to_corner = (closest_corner - input).abs
    total_distance = odd - 1 - distance_to_corner
    puts "total distance: #{total_distance}"
    break
  end
end


# This is heavily inpired by https://www.reddit.com/r/adventofcode/comments/7h7ufl/2017_day_3_solutions/dqoymtk/
# I think it will fail for ~12% of numbers because of the way I calculate the distance between corners. (i.e.) I
# calculate 10 to be closest to 13, even though 25 is closer. This needs to be checked in smallest_diff