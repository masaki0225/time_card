require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:undine)
    @project = Project.new( title: "undertale", content: "content",
                            user_id: @user.id )
  end
  
  test "should be valid?" do
    assert @project.valid?
  end
  
  test "user_id should be presence" do
    @project.user_id = nil
    assert_not @project.valid?
  end 
  
  test "title should be presence" do
    @project.title = nil
    assert_not @project.valid?
  end 
  
  test "title should be at most 15 characters" do 
    @project.title = "a" * 16
    assert_not @project.valid?
  end 
  
  test "content should be presence" do
    @preoject.content = nil
    assert_not @project.valid?
  end 
  

end
