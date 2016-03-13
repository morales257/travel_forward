class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #including helpers in the base controller it makes them available to all
  #controllers as well
  include SessionsHelper


end
