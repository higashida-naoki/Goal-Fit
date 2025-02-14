require "test_helper"

class AdminSide::FoodsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_side_foods_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_side_foods_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_side_foods_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_side_foods_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_side_foods_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_side_foods_destroy_url
    assert_response :success
  end
end
