require_relative './spec_helper.rb'
require_relative '../runner.rb'

describe 'Moving around' do 
  it 'knows how to move 2 spaces over' do
    @passing_sleigh = Sleigh.new
    @passing_sleigh.>.v.v

    expect(@passing_sleigh.current_pos).to eq([-2,1])
  end
end

describe 'Houses visited' do
  it 'knows how many houses it has visited' do
    @passing_sleigh = Sleigh.new
    @passing_sleigh.drive('^>v<')
    
    expect(@passing_sleigh.get_unique_pos).to eq(4)
  end

  it 'knows not to double count houses it has been to already' do
    @passing_sleigh = Sleigh.new
    @passing_sleigh.drive('^v^v^v^v^v')

    expect(@passing_sleigh.get_unique_pos).to eq(2)
  end
end


