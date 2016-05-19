require 'rails_helper'

RSpec.describe DownloadsController, type: :controller do


  describe "post #create" do
    it "redirect to login when not logged in" do
      post :create
      expect(response).to redirect_to("/login")
    end
  end

end
