require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get signup" do
    get signup_path
    assert_response :success
    assert_select "title", full_title("Sign Up")
  end
end
