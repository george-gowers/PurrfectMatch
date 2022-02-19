require "test_helper"

class ChatroomsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get chatrooms_index_url
    assert_response :success
  end

  test "should get show" do
    get chatrooms_show_url
    assert_response :success
  end

  test "should get new" do
    get chatrooms_new_url
    assert_response :success
  end

  test "should get create" do
    get chatrooms_create_url
    assert_response :success
  end

  test "should get destroy" do
    get chatrooms_destroy_url
    assert_response :success
  end
end
