require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get categories_new_url
    assert_response :success
  end

  test "should get edit" do
    get categories_edit_url
    assert_response :success
  end

  test "should get show" do
    get categories_show_url
    assert_response :success
  end

  test "should get destroy" do
    get categories_destroy_url
    assert_response :success
  end

  test "should get index" do
    get categories_index_url
    assert_response :success
  end

end
