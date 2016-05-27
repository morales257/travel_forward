class DownloadsController < ApplicationController
  before_action :logged_in_user
  def create
    #download id is established in the download form
    @itinerary = Itinerary.find(params[:downloaded_id])

    if current_user.can_download(@itinerary)

      current_user.download(@itinerary)

      redirect_to @itinerary
    else
      flash[:notice] = "You do not have enough credits to download this itinerary."

    end
  end

  def show
    @itinerary = Itinerary.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf
    end
  end
end
