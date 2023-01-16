require "test_helper"

class Adimin::OrderDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get adimin_order_details_show_url
    assert_response :success
  end

  test "should get update" do
    get adimin_order_details_update_url
    assert_response :success
  end
end
