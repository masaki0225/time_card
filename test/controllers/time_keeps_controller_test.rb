require 'test_helper'

class TimeKeepsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get time_keeps_index_url
    assert_response :success
  end

  test "should get show" do
    get time_keeps_show_url
    assert_response :success
  end

  test "should get create" do
    get time_keeps_create_url
    assert_response :success
  end

end
