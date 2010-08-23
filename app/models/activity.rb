class Activity < ActiveRecord::Base
  has_many :hours
  
  validates_presence_of :name
end
