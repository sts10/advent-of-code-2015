require_relative './spec_helper.rb'
require_relative '../runner.rb'

describe 'Naughty or nice?' do 
  it 'knows if a Child has three vowels' do
    @this_child = Child.new("kdebidddu")

    expect(@this_child.three_vowels?).to be(true)
  end
  it 'knows if a Child does not have three vowels' do
    @this_child = Child.new("kkslkalefff")

    expect(@this_child.three_vowels?).to be(false)
  end
end
