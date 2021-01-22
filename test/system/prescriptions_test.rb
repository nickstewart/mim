require "application_system_test_case"

class PrescriptionsTest < ApplicationSystemTestCase
  setup do
    prescription = prescriptions(:one)
    visit prescription_path(prescription)
  end
  
  teardown do
    Rails.cache.clear
  end

  test "visiting the index" do
    visit prescriptions_url
  
    assert_selector "h1", text: "Prescriptions"
  end
  
  test "creating a prescription" do
    visit prescriptions_path

    click_on "New Prescription"

    fill_in "Name", with: "Creating a prescription"

    click_on "Create Prescription"

    assert_text "Prescription created"
  end

  test "editing a prescription" do
    prescription = prescriptions(:one)
    visit prescription_path(prescription)

    click_on "Edit"

    assert_text "Editing #{prescription.name}"

    fill_in "Name", with: "Editing a prescription"

    click_on "Update Prescription"

    assert_text "Your changes have been saved"
  end

  test "deleting a prescription" do
    prescription = prescriptions(:one)
    visit prescription_path(prescription)
    
    accept_confirm do
      click_on "Delete"
    end

    assert_text "Prescription deleted"
  end
end
