require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup infomation" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params:{
        user:{
          id: "",
          name: "",
          email: "user@invalid",
          password: "foo",
          password_confirmation: "bar"
        }
      }
    end
    assert_template 'users/new'
    assert_select 'form[action="/signup"]' #postのsignupが存在するかどうか？
    assert_select 'div#error_explanation'
    assert_select 'form input.form-control',4
    assert_select 'form input#user_name'
    assert_select 'form input#user_email'
    assert_select 'form input#user_password'
    assert_select 'form input#user_password_confirmation'
  end
  
  test "valid signup infomation" do
    get signup_path
    assert_difference 'User.count',1 do
      post users_path, params:{
        user:{
          name:"Example User",
          email:"user@example.com",
          password:"password",
          password_confirmation:"password"
        }
      }     
    end
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.nil?
  end
end
