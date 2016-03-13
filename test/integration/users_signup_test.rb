require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  #include ActionView::SessionsHelper

  test "invalid signup submission" do
    get signup_path
    #assert_no_difference makes sure that evaluating the numeric result of an
    #expression is the same before and after invoking the block
    assert_no_difference 'User.count' do
      post users_path, user: { name: " ", email: "hey@example", password: "foo",
        password_confirmation: "bar"}
    end
    assert_template 'users/new'
  end

  test "valid signup" do
    get signup_path
    assert_difference 'User.count', 1 do
      #post_via_redirect follows the redirect to the user's page
      post_via_redirect users_path, user: { name: "Frank ", email: "hey@example.com",
         password: "foobar",
        password_confirmation: "foobar"}
    end
    assert_template 'users/show'
    assert is_logged_in?
  end
end
