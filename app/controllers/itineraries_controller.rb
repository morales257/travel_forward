class ItinerariesController < ApplicationController
  # respond_to :html, :js
  before_action :logged_in_user, only: [:new, :create]

  def index
    #if params[:search].blank?
    #  flash[:notice] = " You must enter a country you want to visit."
    #  render 'static_pages/home'
    #elsif
    #  name = params[:search].titleize
    #  @page = Page.find_by(name: name)
    #  @itineraries = Itinerary.near(params[:search])

    #  redirect_to @page

    #else
    @search = params[:query][:search]
    duration = params[:query][:duration].converted_to_days
    budget = params[:query][:budget]
    @itineraries ||= Itinerary.where('country = ? AND trip_in_days <= ? AND budget <= ?', @search, duration, budget)
    #end
  end

  def show
    @itinerary = Itinerary.find(params[:id])
    @user = User.find_by(params[@itinerary.user_id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = PreviewPDF.new(@itinerary)
        send_data pdf.render, filename: "#{@itinerary.document_file_name}_preview.pdf",
        type: 'application/pdf', disposition: 'inline'
      end
    end

  end

  def new
    @itinerary = Itinerary.new
  end

  def create
    @itinerary = current_user.itineraries.build(itinerary_params)
    #@user = User.find(params[:id])

    if @itinerary.save
      # render the page with the users itineraries
      current_user.upload_credits
      flash[:success] = 'Your itinerary has been added!'
      redirect_to current_user
    else
      # show the add itinerary page
      #flash.now[:danger] = @itinerary.errors.full_messages
      render '_new'
    end

  end

  private

  def itinerary_params
    params.require(:itinerary).permit(:country, :locations, :trip_duration,
    :budget, :document)
  end

end
