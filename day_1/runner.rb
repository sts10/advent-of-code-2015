require 'pry'
puts "paste input"
# input = gets.chomp
def get_floor(p_string)
  floor = 0
  p_string.each_char do |char|
    if char == "("
      floor = floor + 1
    elsif char == ")"
      floor = floor - 1
    end
  end
  return floor
end

def get_position(p_string)
  position = 0 
  floor = 0
  p_string.each_char do |char|
    position = position + 1
    if char == "("
      floor = floor + 1
    elsif char == ")"
      floor = floor - 1
    end
    if floor == -1 
      break
    end
  end
  return position
end


file_string = ""
File.open("./input", "r") do |f|
  f.each_line do |line|
    puts line
    file_string = line.to_s
    break
  end
end

# puts get_floor(file_string)
# test_1 = get_floor("(((")
# test_2 = get_floor('))(((((')
# test_3 = get_floor('))(')
# puts "test 1 #{test_1}"
# puts "test 2 #{test_2}"
# puts "test 3 #{test_3}"

puts get_position(file_string)
test_1 = get_position(")")
test_2 = get_position('()())')
puts "test 1 #{test_1}"
puts "test 2 #{test_2}"
