# == Schema Information
#
# Table name: roles
#
#  id             :integer          not null, primary key
#  episode_id     :integer
#  participant_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Role < ActiveRecord::Base
  attr_accessible :episode_id, :participant_id
  belongs_to :episode
  belongs_to :participant
end
