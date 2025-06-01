require "test_helper"

class FrimasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get frimas_index_url
    assert_response :success
  end
end
