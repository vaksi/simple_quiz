require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "invalid signup information" do
    get new_user_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar",
                                         role: "teacher" } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end

  test "invalid role information" do
    get new_user_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar",
                                         role: "teeee" } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end
end
