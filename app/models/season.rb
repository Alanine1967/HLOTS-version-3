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

class Season < ActiveRecord::Base
  attr_accessible :number, :year
  validates_presence_of :number, :year
  validates_uniqueness_of :number
  validates_numericality_of :number, only_integer: true, greater_than: 0
  validates_numericality_of :year, only_integer: true
  has_many :episodes, dependent: :destroy
end
