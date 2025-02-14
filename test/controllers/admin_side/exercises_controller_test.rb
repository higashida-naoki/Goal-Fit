require "test_helper"

class AdminSide::ExercisesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_side_exercises_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_side_exercises_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_side_exercises_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_side_exercises_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_side_exercises_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_side_exercises_destroy_url
    assert_response :success
  end
end
