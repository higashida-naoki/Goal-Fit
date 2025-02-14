require "test_helper"

class UserSide::FoodsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_side_foods_index_url
    assert_response :success
  end
end
