require 'rails_helper'


RSpec.describe ReviewsController, type: :controller do

  describe "GET #new" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      @itinerary = @user.itineraries.create(attributes_for(:itinerary))
      @itin_id = @itinerary.id
    end

    context "when user is logged in" do
      before(:each) do
        session[:user_id] = @user.id
      end

      it "renders the new template" do
        get :new, { itinerary_id: @itin_id }
        expect(response).to render_template("new")
      end
    end

    context "when user is anon" do

      it "should redirect to login" do
        get :new, {itinerary_id: @itin_id}
        expect(response).to redirect_to login_path
      end
    end
  end


#  describe "POST #create" do
#    before(:each) do
#      @user = FactoryGirl.create(:user)
#      @itinerary = @user.itineraries.create(attributes_for(:itinerary))
#      @itin_id = @itinerary.id
#      session[:user_id] = @user.id
#    end


#    it "renders the itinerary view on successful review" do
#      params = ActionController::Parameters.new(review: {rating: '5', comment: "Great!"})

#      review = Review.create(params.require(:review).permit)
#      post :create, { itinerary_id: @itin_id }, [review]
#      expect(response).to render_template("itineraries#show")
#    end
#  end

end
