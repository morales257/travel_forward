class SessionsController < ApplicationController
  #respond_to :html, only: [:new]
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    #authenticate is a method from has_secure_password
    #authenticate takes a password and returns the user if password matches that
    #user and false otherwise
    #if they match, log in
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user
    else
      #the now variant is designed to display flash on rendered page,
      #and disappear with additional requests (renders do not count as
      #a request)
      flash.now[:danger] = "Invalid password/email combination!"
    render 'new'
  end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
