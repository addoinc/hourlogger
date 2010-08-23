class AddActivityToHour < ActiveRecord::Migration
  def self.up
    add_column :hours, :activity_id, :integer
  end
  
  def self.down
    remove_column :hours, :activity_id
  end
end
