require "test_helper"

class Admin::TrainingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_trainings_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_trainings_new_url
    assert_response :success
  end

  test "should get show" do
    get admin_trainings_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_trainings_edit_url
    assert_response :success
  end

  test "should get create" do
    get admin_trainings_create_url
    assert_response :success
  end

  test "should get update" do
    get admin_trainings_update_url
    assert_response :success
  end
end
