require File.dirname(__FILE__) + '/../test_helper'

class ProjectTest < ActiveSupport::TestCase
  
  def test_all_validations
    assert_raise( ActiveRecord::RecordInvalid ) { Project.new.save! }
    project = Project.new(:name => "")
    project.valid?
    assert_equal(
      project.errors.on(:name).to_s,
      "can't be blank"
    )
  end
  
  def test_ensure_associations_exist
    assert_equal Project.reflect_on_all_associations(:has_many).length, 2
    all_associations = Project.reflections
    assert_equal :has_many, all_associations[:hours].macro
    assert_equal :has_many, all_associations[:users].macro
    assert_equal :hours, all_associations[:users].options[:through]
  end
  
end
