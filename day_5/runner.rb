require 'pry'
class Child
  def initialize(string)
    @array = string.each_char.to_a
  end

  def nice?
    self.three_vowels? && self.twice_row? && !self.has_a_bad_combo?
  end

  def nice_part2?
    self.pairs? && self.every_other?
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

  def pairs? # is this just checking for hetero pairs now?
    # first, clean triple
    a = []
    @array.each_with_index do |l, i|
      if (@array[i] == @array[i+1]) && (@array[i+1] == @array[i+2]) && (@array[i+2] != @array[i+3])
      else
        a << l
      end
    end

    matched_pairs = []
    homo_pairs = []
    combo_array = a.each_slice(2).to_a
    offset_combo_array = combo_array.flatten[1..-1].each_slice(2).to_a

    big_array = combo_array + offset_combo_array
    big_array.each do |pair|
      if pair.count == 2 && big_array.count(pair) > 1
        matched_pairs << pair
      end
      if pair[0] == pair[1]
        homo_pairs << pair
      end
    end
    # matched_pairs.count != matched_pairs.uniq.count
    matched_pairs.count > 0 || homo_pairs.count != homo_pairs.uniq.count
  end

  def every_other?
    trio_array = @array.map.with_index { |l,i| l + @array[i+1] + @array[i+2] if @array[i+2] && @array[i+2] }
    trio_array.any? { |trio| trio[0] == trio[2] if trio }
  end
end

def count_nice_children_from_file(file_location)
  File.open(file_location, "r") do |f|
    f.count { |line| Child.new(line).nice_part2? }
  end
end

# puts count_nice_children_from_file('./input')
# binding.pry
# c = Child.new("xxyxx")
# puts c.pairs?
