require 'test_helper'

class TagsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tags_index_url
    assert_response :success
  end

  test "should get new" do
    get tags_new_url
    assert_response :success
  end

  test "should get crate" do
    get tags_crate_url
    assert_response :success
  end

  test "should get destroy" do
    get tags_destroy_url
    assert_response :success
  end
end
