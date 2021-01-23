require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest

  test "should get home" do
    get root_path
    assert_response :success
    asssert_select "title", "ProjectToDo"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "ProjectToDo"
  end

end
