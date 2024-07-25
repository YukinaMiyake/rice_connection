require "test_helper"

class ProducersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get producers_show_url
    assert_response :success
  end

  test "should get edit" do
    get producers_edit_url
    assert_response :success
  end
end
