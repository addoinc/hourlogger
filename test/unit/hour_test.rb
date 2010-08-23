require File.dirname(__FILE__) + '/../test_helper'

class HourTest < ActiveSupport::TestCases
  
  fixtures :users, :projects
  
  test "Validations" do
    assert_raise( ActiveRecord::RecordInvalid ) { Hour.new.save! }
    hour = Hour.new
    hour.valid?
    assert_equal(
      hour.errors.on(:log_date).to_s,
      "can't be blank"
    )
  end
  
  test "should ensure that to is greater the from" do
    hour = Hour.new(
      :log_date => Date.today,
      :to => Time.now,
      :from => Time.now + 1,
      :description => "test",
      :user_id => users(:quentin).id,
      :project_id => projects(:projectone).id
    )
    hour.valid?
    puts hour.errors.on(:to)
    assert_equal("should be greater than From", hour.errors.on(:to))
    assert_equal("should be less than To", hour.errors.on(:from))
  end
  
end
