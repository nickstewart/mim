require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  teardown do
    Rails.cache.clear
  end

  test "that it has routes for users" do
    assert_routing '/users', controller: 'users', action: 'index'
    assert_routing '/users/new', controller: 'users', action: 'new'
  end

  # Functional Tests
   
  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should create user" do

    valid_params = {
      user: {
        name: "test",
        password: "secret",
        email: "someone@example.com"
      }
    }

    assert_difference("User.count") do
      post users_url, params: valid_params
    end
    assert_redirected_to user_path(User.last)
    assert_equal "Account created", flash[:notice]
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: {user:{name: "updated"}}

    # assert_redirected_to user_path(@user)
    # Reload association to fetch updated data and assert that name is updated.
    @user.reload
    assert_equal "updated", @user.name
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete user_url(@user)
    end

    assert_redirected_to prescriptions_path
  end

end

