require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  context "when user is not admin" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      session[:user_id] = @user.id
    end

    it "can't new page" do
      get :new
      expect(response).to redirect_to("/")
    end

    it "can't create page" do
      post :create
      expect(response).to redirect_to("/")
    end


  end

end
