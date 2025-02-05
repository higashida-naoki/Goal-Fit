require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get unsubscribe" do
    get users_unsubscribe_url
    assert_response :success
  end

  test "should get withdraw" do
    get users_withdraw_url
    assert_response :success
  end
end
