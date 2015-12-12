class Child
  def initialize(string)
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
  end

  def has_a_bad_combo?
    combo_array = @array.map.with_index { |l, i| l + @array[i+1] if @array[i+1] }
    combo_array.any? { |combo| ["ab","cd","pq","xy"].include?(combo.to_s) }
  end
end

def count_nice_children_from_file(file_location)
  File.open(file_location, "r") do |f|
    f.count { |line| Child.new(line).nice? }
  end
end

puts count_nice_children_from_file('./input')
