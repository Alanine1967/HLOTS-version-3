# == Schema Information
#
# Table name: participants
#
#  id          :integer          not null, primary key
#  role        :text
#  first_name  :text
#  middle_name :text
#  surname     :text
#  biography   :text
#  cast        :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Participant do
  it { should validate_presence_of(:role) }
  it { should validate_presence_of(:surname) }
  it "is valid with valid attributes" do
    participant = Participant.new(role: "John Doe", surname: "Doe")
    participant.should be_valid
  end
end
