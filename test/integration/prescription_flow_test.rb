require "test_helper"

class PrescriptionFlowTest < ActionDispatch::IntegrationTest
  test "can see the Prescriptions page" do
    get "/prescriptions"
    assert_select "h1", "Prescriptions"
  end

  test "can create a prescription" do
    get "/prescriptions/new"
    assert_response :success

    post "/prescriptions",
      params: { prescription: { name: "can create prescription" } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "h1", "can create prescription"
  end

  test "can delete a prescription" do
    p = prescriptions(:one)
    get "/prescriptions/#{p.id}"
    assert_response :success
    assert_select "h1", p.name

    delete "/prescriptions/#{p.id}",
      params: { prescription: { id: p.id } } 
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "h1", "Prescriptions"
  end
end
