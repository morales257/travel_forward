require 'test_helper'

class ItinerariesUploadTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "redirect uploader if not logged in" do
   get new_itinerary_path
   assert_redirected_to login_path
  end

  test "itinerary upload must be valid" do
    log_in_as @user
    xhr :get, '/itineraries/new'
    assert_template "itineraries/_new"
    assert_no_difference 'Itinerary.count' do
    post itineraries_path, itinerary: {country: "", trip_duration: "2 weeks", budget:3000, document: ""}
    end
    assert_template "itineraries/_new"
    assert_not flash.empty?
  end

#Read up on Factory Girl & Rspec to test document upload
# test "itinerary gets uploaded" do
#    log_in_as @user
#    itinerary = fixture_file_upload('files/itinerary_2.pdf', 'application/pdf')
#    get new_itinerary_path
#    assert_template "itineraries/new"
#    assert_difference 'Itinerary.count', 1 do
#      post itineraries_path, itinerary: {country: "italy",
#        locations: "Venice, Rome", trip_duration: "2 weeks", budget: 3000, document: itinerary}
#    end
#    assert_redirected_to @user
#  end

#Test the whole process of inputing itinerary in form and that itinerary showing
#in index page and show page + downloading it and it showing up in user page

end
