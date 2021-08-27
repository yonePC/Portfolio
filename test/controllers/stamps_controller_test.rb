require 'test_helper'

class StampsControllerTest < ActionDispatch::IntegrationTest
  test "should get crate" do
    get stamps_crate_url
    assert_response :success
  end

  test "should get destroy" do
    get stamps_destroy_url
    assert_response :success
  end
end
