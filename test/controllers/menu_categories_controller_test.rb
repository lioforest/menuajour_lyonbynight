require 'test_helper'

class MenuCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get menu_categories_create_url
    assert_response :success
  end

  test "should get new" do
    get menu_categories_new_url
    assert_response :success
  end

  test "should get edit" do
    get menu_categories_edit_url
    assert_response :success
  end

  test "should get update" do
    get menu_categories_update_url
    assert_response :success
  end

  test "should get destroy" do
    get menu_categories_destroy_url
    assert_response :success
  end

end
