require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get signup" do
    get signup_path
    assert_response :success
    assert_serect "title", full_title("Signup")
  end

end
