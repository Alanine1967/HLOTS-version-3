# == Schema Information
#
# Table name: seasons
#
#  id         :integer          not null, primary key
#  number     :integer
#  year       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Season do
  it { should validate_presence_of(:number) }
  it { should validate_uniqueness_of(:number) }
  it { should validate_numericality_of(:number) }
  it { should validate_presence_of(:year) }
  it { should validate_numericality_of(:year) }
  it "is valid with valid attributes" do
    season = Season.new(number: 1, year: 1991)
    season.should be_valid
  end
end
