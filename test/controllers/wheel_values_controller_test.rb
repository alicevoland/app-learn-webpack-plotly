require 'test_helper'

class WheelValuesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get wheel_values_show_url
    assert_response :success
  end

end
