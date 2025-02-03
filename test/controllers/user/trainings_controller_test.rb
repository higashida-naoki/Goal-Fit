require "test_helper"

class User::TrainingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_trainings_index_url
    assert_response :success
  end

  test "should get show" do
    get user_trainings_show_url
    assert_response :success
  end
end
