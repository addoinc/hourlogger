class AddDefaultRoles < ActiveRecord::Migration
  def self.up
    execute("insert into roles(name) values('admin')")
    execute("insert into roles(name) values('team_member')")
  end
  
  def self.down
    execute("truncate table roles")
  end
end
