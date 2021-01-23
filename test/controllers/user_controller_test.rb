require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest

  test "should get new" do
    get signup_path
    assert_response :success
  end

  test "should get edit" do
    get edit_user_path
    assert_response :success
  end

  test "should get show" do

  end
end
