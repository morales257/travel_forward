class ItinerariesController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]

  def index
    @search = params[:query][:search]
    duration = params[:query][:duration].converted_to_days
    budget = params[:query][:budget]
    @itineraries ||= Itinerary.where('country = ? AND trip_in_days <= ? AND budget <= ?', @search, duration, budget)
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
    if @itinerary.save
      # render the page with the users itineraries
      current_user.upload_credits
      flash[:success] = 'Your itinerary has been added!'
      redirect_to current_user
    else
      render '_new'
    end
  end

  private

  def itinerary_params
    params.require(:itinerary).permit(:country, :locations, :trip_duration,
    :budget, :document)
  end

end
