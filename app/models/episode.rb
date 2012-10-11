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

class Episode < ActiveRecord::Base
  attr_accessible :first_shown, :number, :synopsis, :title, :season_id
  validates_presence_of :first_shown, :number, :synopsis, :title
  validates :number, numericality: { greater_than: 0, only_integer: true}
  belongs_to :season
  has_many :roles
  has_many :participants, through: :roles
end
