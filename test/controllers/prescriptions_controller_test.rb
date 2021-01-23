require "test_helper"

class PrescriptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @prescription = prescriptions(:one)
  end

  teardown do
    Rails.cache.clear
  end

  test "that it has routes for prescriptions" do
    assert_routing '/', controller: 'prescriptions', action: 'index'
    assert_routing '/prescriptions/new', controller: 'prescriptions', action: 'new'
  end

  # Functional Tests
   
  test "should get index" do
    get prescriptions_url
    assert_response :success
  end

  test "should create prescription" do
    assert_difference("Prescription.count") do
      post prescriptions_url, params: {prescription:{name: "Rails is awesome!"}}
    end
    assert_redirected_to prescription_path(Prescription.last)
    assert_equal "Prescription created", flash[:notice]
  end

  test "should show prescription" do
    get prescription_url(@prescription)
    assert_response :success
  end

  test "should update prescription" do
    patch prescription_url(@prescription), params: {prescription:{name: "updated"}}

    assert_redirected_to prescription_path(@prescription)
    # Reload association to fetch updated data and assert that title is updated.
    @prescription.reload
    assert_equal "updated", @prescription.name
  end

  test "should destroy prescription" do
    assert_difference("Prescription.count", -1) do
      delete prescription_url(@prescription)
    end

    assert_redirected_to prescriptions_path
  end

end

