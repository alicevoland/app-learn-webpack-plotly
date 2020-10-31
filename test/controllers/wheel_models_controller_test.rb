require 'test_helper'

class WheelModelsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get wheel_models_index_url
    assert_response :success
  end

  test "should get show" do
    get wheel_models_show_url
    assert_response :success
  end

end
