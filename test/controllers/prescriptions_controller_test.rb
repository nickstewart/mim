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
end

