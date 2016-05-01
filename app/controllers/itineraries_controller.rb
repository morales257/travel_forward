class ItinerariesController < ApplicationController
  respond_to :html, :js
  before_action :logged_in_user, only: [:new, :create]

  def index
    if params[:search].blank?
      flash[:notice] = " You must enter a country you want to visit."
      render 'static_pages/home'
    else
      @itineraries = Itinerary.near(params[:search])
    end
  end

  def show
    @itinerary = Itinerary.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = PreviewPDF.new(@itinerary)
        send_data pdf.render, filename: "#{@itinerary.document_file_name}_preview.pdf",
        type: "application/pdf", disposition: "inline"
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
      flash[:success] = "Your itinerary has been added!"
      redirect_to request.referrer || current_user
    else
      #show the add itinerary page
      flash[:error] = @itinerary.errors.full_messages
      render 'new'
    end


  end

  private

  def itinerary_params
    params.require(:itinerary).permit(:country, :locations, :trip_duration,
    :budget, :document)
  end
end
