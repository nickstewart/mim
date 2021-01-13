require "test_helper"

class PrescriptionsControllerTest < ActionDispatch::IntegrationTest
  test "that it has routes for prescriptions" do
    assert_routing '/prescriptions', controller: 'prescriptions', action: 'index'
  end

  # Functional Tests
   
  test "should get index" do
    get prescriptions_url
    assert_response :success
  end

  test "should create prescription" do
    assert_difference("Prescription.count") do
      post prescriptions_url, params: { prescription: { name: "Rails is awesome!" } }
    end
    assert_redirected_to prescription_path(Prescription.last)
    assert_equal "Prescription successfully created!", flash[:notice]
  end

  test "should show prescription" do
    prescription = prescriptions(:one)
    get prescription_url(prescription)
    assert_response :success
  end

  test "should destroy prescription" do
    prescription = prescriptions(:one)
    assert_difference("Prescription.count", -1) do
      delete prescription_url(prescription)
    end

    assert_redirected_to prescriptions_path
  end
end

