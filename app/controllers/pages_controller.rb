class PagesController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]

  def new
    @user = User.find_by(params[:user_id])
    @page = Page.new
  end

  def create
    @user = User.find_by(params[:user_id])
    @page = Page.new(pages_params)

    if @page.save
      flash[:success] = "New country page has been added."
      redirect_to @page
    else
      flash[:error] = @page.errors.full_messages
      render 'new'
    end
  end

  def show
    @page = Page.find(params[:id])
   @itineraries = Itinerary.near(@page.name)
  end

  def edit
  end

  def update
  end

  def destroy
  end

#routes the search from the home page to the country/default page
  def results
    if params[:search].blank?
      flash[:notice] = " You must enter a country you want to visit."
      render 'static_pages/home'
    elsif Page.exists?(name: params[:search])
      #this would have been loaded at the start of the app, and routes to pages#show
      redirect_to "/#{params[:search]}"
    else
      #session[:search] = params[:search]
      redirect_to controller: 'itineraries', action: 'index', query: { search: params[:search],
      duration: params[:duration], budget: params[:budget] }
      #"/pages/results?search=Italy"
      #"/iteneraries?search=Italy&second_value=foobar"
    end
  end

  private

  def pages_params
    params.require(:page).permit(:name, :title, :description, :background, :author_id)
  end
end
