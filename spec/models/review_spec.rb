require 'rails_helper'

describe Review do
  let(:user) { FactoryGirl.create(:user)}

  it "has a valid review" do
    expect(user.reviews.create(attributes_for(:review))).to be_valid
  end

  context "rating is blank" do
    let(:review) {user.reviews.create(attributes_for(:review, rating: nil))}

    it "should not be valid" do
      expect(review).to_not be_valid
    end
  end

  context "rating is not a number" do
    let(:review) {user.reviews.create(attributes_for(:review, rating: "string"))}

    it "should not be valid" do
      expect(review).to_not be_valid
    end
  end

  context "comment is blank" do
    let(:review) {user.reviews.create(attributes_for(:review, comment: nil))}

    it "should not be valid" do
      expect(review).to_not be_valid
    end
  end

end
