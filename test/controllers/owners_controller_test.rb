require "test_helper"

class OwnersControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get owners_dashboard_url
    assert_response :success
  end
end
