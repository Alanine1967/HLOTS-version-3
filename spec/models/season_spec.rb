require 'spec_helper'

describe Season do
  before(:each) do
    @attr = {
      number: 1,
      first_shown: Date.new(1991,2,3)
    }
  end
  it 'should create a new instance given valid attributes' do
    Season.create!(@attr)
  end
  it 'should require a number when creating a new instance' do
    no_number_season = Season.new(@attr.merge(number: nil))
    no_number_season.should_not be_valid
  end
  it 'should require a date' do
    no_date_season = Season.new(@attr.merge(first_shown: nil))
    no_date_season.should_not be_valid
  end
end
