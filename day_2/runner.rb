require 'pry'
puts "start"

test_array = ["2x3x4", "3x4x2", "1x1x10"]

class Box
  def initialize(dimensions_string)
    @dim_array = dimensions_string.split('x').sort
    @dim_array.map! { |e| e.to_i }
  end

  def measure_box
    sides = []
    sides[0] = 2 * @dim_array[0] * @dim_array[1]
    sides[1] = 2 * @dim_array[1] * @dim_array[2]
    sides[2] = 2 * @dim_array[0] * @dim_array[2]
    sides.sort!
    slack = sides[0] / 2
    sq_feet = sides[0] + sides[1] + sides[2] + slack
  end

  def measure_ribbon
    @dim_array.sort!
    @dim_array[0]*2 + @dim_array[1]*2 + @dim_array[0]*@dim_array[1]*@dim_array[2]
  end
end

def measure_boxes(boxes_array)
  total_sq_feet = 0 
  boxes_array.each do |box_string|
    this_box = Box.new(box_string)
    total_sq_feet = total_sq_feet + this_box.measure_box
  end
  return total_sq_feet
end

def measure_ribbons(boxes_array)
  total_ribbon = 0
  boxes_array.each do |box_string|
    total_ribbon = total_ribbon + Box.new(box_string).measure_ribbon
  end
  total_ribbon
end

file_array = []
File.open("./input", "r") do |f|
  f.each_line do |line|
    # puts line
    file_array << line.to_s
  end
end

def run_tests(test_array)
  test_array.each do |box_string|
    puts Box.new(box_string).measure_ribbon
  end
end

run_tests(test_array)

puts measure_ribbons(file_array)
