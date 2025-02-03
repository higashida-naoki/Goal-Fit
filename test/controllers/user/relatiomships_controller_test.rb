require "test_helper"

class User::RelatiomshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get user_relatiomships_create_url
    assert_response :success
  end

  test "should get destroy" do
    get user_relatiomships_destroy_url
    assert_response :success
  end

  test "should get followings" do
    get user_relatiomships_followings_url
    assert_response :success
  end

  test "should get followers" do
    get user_relatiomships_followers_url
    assert_response :success
  end
end
