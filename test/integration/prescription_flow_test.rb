require "test_helper"

class PrescriptionFlowTest < ActionDispatch::IntegrationTest
  test "can see the Prescriptions page" do
    get "/prescriptions"
    assert_select "h1", "Prescriptions"
  end

  test "can create an prescription" do
    get "/prescriptions/new"
    assert_response :success

    post "/prescriptions",
      params: { prescription: { name: "can create prescription" } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "h1", "can create prescription"
  end
end
