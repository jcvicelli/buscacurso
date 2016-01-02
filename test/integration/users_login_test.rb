require 'test_helper'
class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:jean)
  end

  test "login with invalid information" do
    get new_user_session_path
    post user_session_path, session: { email: @user.email, password: '123' }
    assert_not flash.empty?
    assert_template 'devise/sessions/new'
  end

end
