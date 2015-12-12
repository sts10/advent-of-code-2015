require_relative './spec_helper.rb'
require_relative '../runner.rb'

describe 'Naughty or nice components' do 
  it 'knows if a Child has three vowels' do
    @this_child = Child.new("kdebidddu")

    expect(@this_child.three_vowels?).to be(true)
  end
  it 'knows if a Child does not have three vowels' do
    @this_child = Child.new("kkslkalefff")

    expect(@this_child.three_vowels?).to be(false)
  end

  it 'know if a Child has two characters in a row' do
    @this_child = Child.new("ihjdfbb")

    expect(@this_child.twice_row?).to be(true)
  end
  it 'know if a Child does not have two characters in a row' do
    @this_child = Child.new("ihjdfb")

    expect(@this_child.twice_row?).to be(false)
  end

  it 'knows if a child has a bad combo' do
    @this_child = Child.new("tkkabdd")

    expect(@this_child.has_a_bad_combo?).to be(true)
  end
  it 'knows if child does not have a bad combo' do
    @this_child = Child.new("ihjdfb")

    expect(@this_child.has_a_bad_combo?).to be(false)
  end
end

describe 'Full naughty or nice question' do
  it 'knows if a child is nice' do
    @this_child = Child.new("ugknbfddgicrmopn")
    expect(@this_child.nice?).to be(true)
  end

  it 'knows aaa is nice' do
    @this_child = Child.new("aaa")
    expect(@this_child.nice?).to be(true)
  end

  it 'knows jchzalrnumimnmhp is naughty' do
    @this_child = Child.new("jchzalrnumimnmhp")
    expect(@this_child.nice?).to be(false)
  end

  it 'knows haegwjzuvuyypxyu is naughty' do 
    @this_child = Child.new("haegwjzuvuyypxyu")
    expect(@this_child.nice?).to be(false)
  end
  it 'knows dvszwmarrgswjxmb is naughty' do 
    @this_child = Child.new("dvszwmarrgswjxmb")
    expect(@this_child.nice?).to be(false)
  end
end

describe 'count from file list' do
  it 'can count number of nice children from file' do
    expect(count_nice_children_from_file('./input')).to eq(236)
  end
end
