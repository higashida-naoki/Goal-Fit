require "test_helper"

class User::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_users_index_url
    assert_response :success
  end

  test "should get show" do
    get user_users_show_url
    assert_response :success
  end

  test "should get edit" do
    get user_users_edit_url
    assert_response :success
  end

  test "should get favorite" do
    get user_users_favorite_url
    assert_response :success
  end

  test "should get update" do
    get user_users_update_url
    assert_response :success
  end

  test "should get destroy" do
    get user_users_destroy_url
    assert_response :success
  end
end
