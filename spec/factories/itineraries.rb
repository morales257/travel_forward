#include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :itinerary do
    country "Italy"
    locations "Venice, Florence"
    trip_duration "2 weeks"
    budget 2400
    document {  Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/itinerary_2.pdf", "application/pdf") }
    user
  end

  factory :user do
    name "John"
    email {"#{name}@itineraryapp.com"}
    password "foobar"
    password_confirmation "foobar"
  end
end
