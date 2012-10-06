class Episode < ActiveRecord::Base
  attr_accessible :first_shown, :number, :synopsis, :title
end
