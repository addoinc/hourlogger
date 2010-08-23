class Project < ActiveRecord::Base
  
  has_many :hours
  has_many :users, :through => :hours
  
  validates_presence_of :name
  
end
