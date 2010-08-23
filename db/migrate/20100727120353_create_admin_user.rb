class CreateAdminUser < ActiveRecord::Migration
  def self.up
    admin_user = User.create(
      :login => "admin", :email => "gautam.chekuri@gmail.com",
      :password => "letmeinnow", :password_confirmation => "letmeinnow"
    )
    admin_user.register!
    admin_user.activate!
    admin_user.roles << Role.find_by_name("admin")
  end
  
  def self.down
    execute("truncate table users")
  end
end
