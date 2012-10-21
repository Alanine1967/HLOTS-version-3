class Participant < ActiveRecord::Base
  attr_accessible :biography, :cast, :first_name, :middle_name,
                  :role, :surname
  validates_presence_of :role, :surname
  has_many :roles
  has_many :episodes, through: :roles
end
