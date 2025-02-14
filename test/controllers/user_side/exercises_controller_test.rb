require "test_helper"

class UserSide::ExercisesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_side_exercises_index_url
    assert_response :success
  end
end
