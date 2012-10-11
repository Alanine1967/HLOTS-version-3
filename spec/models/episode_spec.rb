# == Schema Information
#
# Table name: episodes
#
#  id          :integer          not null, primary key
#  number      :integer
#  title       :text
#  first_shown :date
#  synopsis    :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  season_id   :integer
#

require 'spec_helper'

describe Episode do
  it { should validate_presence_of(:number) }
  it { should validate_presence_of(:first_shown) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:synopsis) }
  it { should validate_numericality_of(:number) }
  it "should be valid with valid attributes" do
    episode = Episode.new(number: 1, title: "bugs", first_shown: 1991-10-1,
                          synopsis: "an episode")
    episode.should be_valid
  end
end
