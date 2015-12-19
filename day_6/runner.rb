require 'pry'
@light_board = []

1000.times do |i|
  @light_board << Array.new(1000, 0)
end

def print_board(board)
  board.each do |row|
    print row
    print "\n"
  end
end

def make_rectangle(height, width, status)
  board = []
  height.times do 
    board << Array.new(width, status)
  end
  board
end

def turn_on(x1,y1,x2,y2)
  # rectangle = make_rectangle(y2-y1, x2-x1, 1)
  # rectangle.each_with_index do |row, i|
  #   @light_board[y1+i..y2+i].each_with_index do |e, j|
  #     binding.pry
  #     if x1 < j && j < x2
  #       e = 1
  #     end
  #   end
  # end
  @light_board[y1..y2].each do |row|
    row[x1..x2] = Array.new(x2-x1+1, 1)
  end
end

def change_lights(x1,y1,x2,y2,command)
  @light_board[y1..y2].each_with_index do |row,i|
    case command
    when :on
      row[x1..x2] = Array.new(x2-x1+1, 1)
    when :off
      row[x1..x2] = Array.new(x2-x1+1, 0)
    when :toggle
      row[x1..x2].each_with_index do |e,j|
        if e == 1
          @light_board[i][j] = 0
        else 
          @light_board[i][j] = 1
        end
      end
    end
  end
end

def read_line(line)
  if line.include?("on")
    command = :on
  elsif line.include?("off")
    command = :off
  elsif line.include?("toggle")
    command = :toggle
  end
  c1 = line.split(' ')[-3].split(',')
  c2 = line.split(' ')[-1].split(',')
  x1 = c1[0].to_i
  y1 = c1[1].to_i
  x2 = c2[0].to_i
  y2 = c2[1].to_i
  change_lights(x1,y1,x2,y2,command)
end

def count_lights_on
  lights_on = 0
  @light_board.each do |row|
    row.each do |e|
      if e == 1
        lights_on = lights_on + 1
      end
    end
  end
  lights_on
end

# turn_on(2,2,4,7)

File.open('./input', "r") do |f|
  f.each do |line|
    read_line(line)
  end
end

puts count_lights_on
# binding.pry


