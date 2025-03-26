require "test_helper"

class MenuItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get menu_items_create_url
    assert_response :success
  end

  test "should get destroy" do
    get menu_items_destroy_url
    assert_response :success
  end
end
