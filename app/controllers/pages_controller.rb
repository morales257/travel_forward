class PagesController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy]

  def new
    @user = User.find_by(params[:user_id])
    @page = Page.new
  end

  def create
    @user = User.find_by(params[:user_id])
    @page = Page.new(pages_params)

    if @page.save
      flash[:success] = 'New country page has been added.'
      redirect_to action: "show", name: @page.name
    else
      flash[:error] = @page.errors.full_messages
      render 'new'
    end
  end

  def show

    if params[:duration].empty? || params[:budget].empty?
      if Page.exists?(name: params[:name])
        @page = Page.find_by_name(params[:name])
        @itineraries = Itinerary.near(@page.name)
      else
        not_found
      end
    else
      @page = Page.find_by_name(params[:name])
      duration = params[:duration].converted_to_days
      budget = params[:budget]
      @itineraries = Itinerary.where( "country = ? AND trip_in_days <= ? AND budget <= ?", @page.name, duration, budget)
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

#routes the search from the home page to the country/default page
  def results
    params[:budget] = 0 unless !params[:budget].empty?
    if params[:search].blank?
      flash[:notice] = " You must enter a country you want to visit."
      render 'static_pages/home'
    elsif Page.exists?(name: params[:search])
      #this would have been loaded at the start of the app, and routes to pages#show
      redirect_to "/#{params[:search]}?budget=#{params[:budget]}&duration=#{params[:duration]}"
    else
      redirect_to controller: 'itineraries', action: 'index', query: { search: params[:search],
      duration: params[:duration], budget: params[:budget] }

    end
  end



  private

  def pages_params
    params.require(:page).permit(:name, :title, :description, :background, :author_id)
  end
end
