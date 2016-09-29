# application-wide methods
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # including helpers in the base controller it makes them available to all
  # controllers as well
  include SessionsHelper
  include ItinerariesHelper

  def not_found
    render file: "#{Rails.root}/public/404.html", layout: false, status: 404
  end

  private

  # Confirm a logged-in user_id
  def logged_in_user
    unless logged_in?
      flash[:danger] = 'Please log in.'
      # redirect_to login_url
    # because upload is accessed through ajax, we use JS to redirect
    respond_to do |format|
      format.js { render js: "window.location = '#{login_path}'" }
      format.html { redirect_to login_url }
    end

    end
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end

end
