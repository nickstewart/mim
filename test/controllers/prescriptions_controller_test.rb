require "test_helper"

class PrescriptionsControllerTest < ActionDispatch::IntegrationTest
  test "it has routes for prescriptions" do
    assert_routing '/prescriptions', controller: 'prescriptions', action: 'index'
  end
end
