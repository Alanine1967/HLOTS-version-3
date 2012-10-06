class Season < ActiveRecord::Base
  attr_accessible :number, :year
  validates_presence_of :number, :year
  validates_uniqueness_of :number
  validates_numericality_of :number, only_integer: true, greater_than: 0
  validates_numericality_of :year, only_integer: true
end
