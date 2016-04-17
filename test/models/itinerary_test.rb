require 'test_helper'

class ItineraryTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    @itinerary = itineraries(:one)
  end

  test "itinerary should be valid" do
    assert @itinerary.valid?
  end

  test "make sure user id is present" do
    @itinerary.user_id = nil
    assert_not @itinerary.valid?
  end

  test "make sure country field is present" do
    @itinerary.country = nil
    assert_not @itinerary.valid?
  end

  test "make sure locations field is present" do
    @itinerary.locations = nil
    assert_not @itinerary.valid?
  end

  test "make sure duration field is present" do
    @itinerary.trip_duration = nil
    assert_not @itinerary.valid?
  end

  test "make sure budget field is present" do
    @itinerary.budget = nil
    assert_not @itinerary.valid?
  end

  test "make sure budget only accepts a number" do
    @itinerary.budget = "two hundred"
    assert_not @itinerary.valid?
  end

test "make sure budget is a number" do
  @itinerary.budget = 3000
  assert @itinerary.valid?
end

end
