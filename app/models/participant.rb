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

class Participant < ActiveRecord::Base
  attr_accessible :biography, :cast, :first_name, :middle_name, :role, :surname
  validates_presence_of :role, :surname
end
