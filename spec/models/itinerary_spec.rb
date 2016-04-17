require 'rails_helper'

describe Itinerary do
  let(:user) { FactoryGirl.create(:user)}
  it "has a valid itinerary" do

    expect(user.itineraries.create(attributes_for(:itinerary))).to be_valid
  end

  context "when country is blank" do
    let(:itinerary) {user.itineraries.create(attributes_for(:itinerary, country: nil))}
  it "should not be valid" do
      expect(itinerary).to_not be_valid
  end
end

  context "when itinerary upload is blank" do
    let(:itinerary) {user.itineraries.create(attributes_for(:itinerary, document: nil))}

    it "should not be valid" do
      expect(itinerary).to_not be_valid
    end
  end
  context "upload is not a pdf" do
    let(:itinerary) { user.itineraries.create(attributes_for(:itinerary,
      document: Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/itinerary.png", "image/png")))}

    it "should not be valid" do
      expect(itinerary).to_not be_valid
    end
  end

end
