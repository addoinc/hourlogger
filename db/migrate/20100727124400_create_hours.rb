class CreateHours < ActiveRecord::Migration
  def self.up
    create_table :hours do |t|
      t.integer :project_id
      t.integer :user_id
      t.date :log_date
      t.time :from
      t.time :to
      t.text :description
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :hours
  end
end
