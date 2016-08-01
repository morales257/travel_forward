class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #including helpers in the base controller it makes them available to all
  #controllers as well
  include SessionsHelper
  include ItinerariesHelper

  private

  #Confirm a logged-in user_id
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      #redirect_to login_url
    #because upload is accessed through ajax, we use JS to redirect 
      render :js => "window.location = '#{login_path}'"
    end
  end

end
