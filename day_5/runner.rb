require 'pry'

class Child
  def initialize(string)
    @string = string
    @array = string.each_char.to_a
  end
  def nice?
    self.three_vowels? && self.twice_row && !self.has_a_bad_combo
  end

  def three_vowels?
    vowels = ['a','e','i','o','u']
    count = @array.count { |l| vowels.include?(l) }
    # if count >= 3 ? true : false
    count >=3
  end

end


# file_string = ""
# File.open(file_location, "r") do |f|
#   f.each_line do |line|
#     file_string = file_string + line.to_s
#   end
# end


