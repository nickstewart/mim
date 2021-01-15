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

  test "can edit a prescription" do
    p = prescriptions(:one)
    get "/prescriptions/#{p.id}/edit"
    assert_response :success

    patch "/prescriptions/#{p.id}",
      params: {prescription:{name: "updated"}}
    assert_response :redirect
    follow_redirect!
    assert_equal "/prescriptions/#{p.id}", path
    assert_equal "Your changes have been saved.", flash[:notice] 
  end

  test "can delete a prescription" do
    p = prescriptions(:one)
    get "/prescriptions/#{p.id}"
    assert_response :success
    assert_select "h1", p.name

    delete "/prescriptions/#{p.id}"
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "h1", "Prescriptions"
  end
end

