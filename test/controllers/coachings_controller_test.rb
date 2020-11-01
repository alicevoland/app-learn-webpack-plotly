require 'test_helper'

class CoachingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get coachings_index_url
    assert_response :success
  end

  test "should get show" do
    get coachings_show_url
    assert_response :success
  end

end
