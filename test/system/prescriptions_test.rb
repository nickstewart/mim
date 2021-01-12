require "application_system_test_case"

class PrescriptionsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit prescriptions_url
  
    assert_selector "h1", text: "Prescriptions"
  end
  
  test "that all prescriptions are listed on the index page" do
  
  end

  test "creating a prescription" do
    visit prescriptions_path

    click_on "New Prescription"

    fill_in "Name", with: "Creating an Prescritpion"

    click_on "Create Prescription"

    assert_text "Prescription successfully created!"
  end
end
