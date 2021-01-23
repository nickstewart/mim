require "test_helper"

class PrescriptionFlowTest < ActionDispatch::IntegrationTest
  setup do
    @script = prescriptions(:one)
  end

  teardown do
    Rails.cache.clear
  end

  test "can see the Prescriptions page" do
    get "/prescriptions"
    assert_select "h1", "Prescriptions"
  end

  test "can create a prescription" do
    get "/prescriptions/new"
    assert_response :success

    post "/prescriptions",
      params: {prescription:{name: "can create prescription"}}
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "h1", "can create prescription"
  end

  test "can edit prescription" do
    get "/prescriptions/#{@script.id}/edit"
    assert_response :success

    patch "/prescriptions/#{@script.id}",
      params: {prescription:{name: "updated"}}
    assert_response :redirect
    follow_redirect!
    assert_equal "/prescriptions/#{@script.id}", path
    assert_equal "Your changes have been saved", flash[:notice] 
  end

  test "can delete prescription" do
    get "/prescriptions/#{@script.id}"
    assert_response :success
    assert_select "h1", @script.name

    delete "/prescriptions/#{@script.id}"
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "h1", "Prescriptions"
  end
end

