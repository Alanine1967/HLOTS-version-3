class Season < ActiveRecord::Base
  attr_accessible :first_shown, :number
  validates :first_shown, presence: true
  validates :number, presence: true
end
