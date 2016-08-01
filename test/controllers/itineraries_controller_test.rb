require 'test_helper'

class ItinerariesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index, query: {search: "Italy", duration: "3 weeks"}
    assert_response :success
  end

#  test "should redirect itinerary Upload when not logged in" do
#    xhr :get, :new
#    assert_redirected_to login_url
#  end


end
