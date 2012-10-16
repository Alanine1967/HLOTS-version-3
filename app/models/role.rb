class Role < ActiveRecord::Base
  attr_accessible :episode_id, :participant_id
  belongs_to :episode
  belongs_to :participant
end
