require 'pry'

class Child
  def initialize(string)
    @string = string
    @array = string.each_char.to_a
  end
  def nice?
    self.three_vowels? && self.twice_row? && !self.has_a_bad_combo?
  end

  def three_vowels?
    @array.count { |l| ['a','e','i','o','u'].include?(l) } >= 3
  end

  def twice_row?
    @array.map.with_index { |l, i| l == @array[i+1] }.any?
    # @array.any? do |l|
    #   next_l = @array[@array.index(l)+1]
    #   next_l && l == next_l
    # end
  end

  def has_a_bad_combo?
    combo_array = @array.map.with_index { |l, i| l + @array[i+1] if @array[i+1] }
    combo_array.any? { |combo| ["ab","cd","pq","xy"].include?(combo.to_s) }
  end
end

Child.new("abbcdd").twice_row?
# file_string = ""
# File.open(file_location, "r") do |f|
#   f.each_line do |line|
#     file_string = file_string + line.to_s
#   end
# end


