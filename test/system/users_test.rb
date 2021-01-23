require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    user = users(:one)
    visit user_path(user)
  end
  
  teardown do
    Rails.cache.clear
  end

  test "visiting the index" do
    visit users_url
  
    assert_selector "h1", text: "Users"
  end
  
  test "creating a user" do
    visit prescriptions_path

    click_on "Sign Up"

    fill_in "Name", with: "Account created"

    fill_in "Email", with: "new_user@example.com"

    fill_in "Password", with: "secret"
    
    fill_in "Confirm Password", with: "secret"

    click_on "Create User"

    assert_text "Account created"
  end

  test "editing a user" do
    user = users(:one)
    visit user_path(user)

    click_on "Edit Account"

    assert_text "Editing #{user.name}"

    fill_in "Name", with: "Editing a user"

    click_on "Update User"

    assert_text "Your changes have been saved"
  end

  test "deleting a user" do
    user = users(:one)
    visit user_path(user)
    
    accept_confirm do
      click_on "Delete"
    end

    assert_text "Account deleted"
  end
end

