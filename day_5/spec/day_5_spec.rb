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
  xit 'can count number of nice children from file' do
    expect(count_nice_children_from_file('./input')).to eq(236)
  end
end

describe 'the pairs problem' do 
  it 'finds a hetero on track pair' do
    expect(Child.new('abcdab').pairs?).to be(true)
  end
  it 'finds a hetero off track pair' do
    expect(Child.new('abcab').pairs?).to be(true)
  end
  it 'finds a homo on track pair' do
    expect(Child.new('aabcaa').pairs?).to be(true)
  end
  it 'finds a homo off track pair' do
    expect(Child.new('aabaa').pairs?).to be(true)
  end
  it 'knows a triple character is not a legit pair' do
    expect(Child.new('aaabcd').pairs?).to be(false)
  end
end

describe 'part 2 naughty or nice' do 
  it 'knows if a pair of letters is repeated' do
    @this_child = Child.new('aabcdefgaa')
    expect(@this_child.pairs?).to be(true)
  end
  it 'knows if a child has no repeated pairs' do
    @this_child = Child.new('aaabcdefgh')
    expect(@this_child.pairs?).to be(false)
  end

  it 'knows if a child has an every other match' do
    @this_child = Child.new('abcdefeghi')
    expect(@this_child.every_other?).to be(true)
  end
  it 'knows if a child does not have an every other match' do
    @this_child = Child.new('uurcxstgmygtbstg')
    expect(@this_child.every_other?).to be(false)
  end
end

describe 'part 2 full tests' do 
  it 'knows qjhvhtzxzqqjkmpb is nice' do 
    @this_child = Child.new('qjhvhtzxzqqjkmpb')
    expect(@this_child.nice_part2?).to be(true)
  end
  it 'knows xxyxx is nice' do
    @this_child = Child.new('xxyxx')
    expect(@this_child.nice_part2?).to be(true)
  end
  it 'knows azbtzbcb is nice' do
    @this_child = Child.new('xazbtzbcb')
    expect(@this_child.pairs?).to be(true)
  end

  it 'knows uurcxstgmygtbstg is naughty' do
    @this_child = Child.new('uurcxstgmygtbstg')
    expect(@this_child.nice_part2?).to be(false)
  end
  it 'knows ieodomkazucvgmuy is nice' do
    @this_child = Child.new('ieodomkazucvgmuy')
    expect(@this_child.nice_part2?).to be(false)
  end
end
