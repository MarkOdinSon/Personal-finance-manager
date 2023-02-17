require "test_helper"

class MainControllerTest < ActionDispatch::IntegrationTest
  test "should get home page" do
    get '/'
    assert_response :success
  end
end
