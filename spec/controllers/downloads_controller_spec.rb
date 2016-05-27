require 'rails_helper'

RSpec.describe DownloadsController, type: :controller do


  describe "post #create" do

    it "redirect to login when not logged in" do
      post :create
      expect(response).to redirect_to("/login")
    end

    context "when user is logged in" do
      before(:each) do
        @user = FactoryGirl.create(:user)
        session[:user_id] = @user.id
        @itinerary = @user.itineraries.create(attributes_for(:itinerary))
        @credit = @user.create_credit(attributes_for(:credit))
      end

    it "redirects to itinerary on successful download " do
      post :create, {downloader_id: @user.id, downloaded_id: @itinerary.id}
      expect(response).to redirect_to(@itinerary)
    end

  #  it "updates the user credit balance" do
  #    expect{ post :create, {downloader_id: @user.id, downloaded_id: @itinerary.id} }.to change(@user.credit.credit_balance, :numerator ).from(1).to(0)
  #  end
  end
  end

end
