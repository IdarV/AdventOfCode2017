@direction = :right
@moves = 1
@current_moves = 0
@x_coord = @y_coord = 0
input = File.read('input.txt').to_i
spiral = Hash.new { |h, k| h[k] = Hash.new { |h2, k2| h2[k2] = 0 } }
spiral[0][0] = 1

def move
  @current_moves = @current_moves + 1

  case @direction
    when :right
      @x_coord = @x_coord + 1
      if @current_moves == @moves
        @direction = :up
        @current_moves = 0
      end
    when :up
      @y_coord = @y_coord - 1
      if @current_moves == @moves
        @direction = :left
        @current_moves = 0
        @moves = @moves + 1
      end
    when :left
      @x_coord = @x_coord - 1
      if @current_moves == @moves
        @direction = :down
        @current_moves = 0
      end
    else # down
      @y_coord = @y_coord + 1
      if @current_moves == @moves
        @direction = :right
        @current_moves = 0
        @moves = @moves + 1
      end
  end
end

def calculate_value (spiral)
  coords = [@x_coord-1, @x_coord, @x_coord+1].product([@y_coord-1, @y_coord, @y_coord+1])
  coords.collect{|k| spiral[k[0]][k[1]]}.inject(:+)
end

until spiral[@x_coord][@y_coord] > input
  move
  spiral[@x_coord][@y_coord] = calculate_value(spiral)
end
puts spiral[@x_coord][@y_coord]



