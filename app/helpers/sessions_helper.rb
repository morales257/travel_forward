module SessionsHelper

  #Log in a given user
  def log_in(user)
    session[:user_id] = user.id
  end

  #Returns the current logged-in user (if any)
  def current_user
    if (user_id = session[:user_id])
    #same as @current_user = @current_user || ....
    @current_user ||= User.find_by(id: user_id)
  elsif (user_id = cookies.signed[:user_id])
    user = User.find_by(id: user_id)
    if user && user.authenticated?(cookies[:remember_token])
      #raise used to test that current user works with proper sessions
      log_in user
      @current_user = user
    end
  end

  end

  #a user is logged in if there is a current user in the session
  def logged_in?
    !current_user.nil?
  end

  #Forgets a persistent session
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  #Log out current user
  def log_out
    forget(current_user)
    session.delete(:user_id)
    #this is the secure way to do it, since current_user would exist on th page
    #if there was no redirect or if it was created before the destroy action
    @current_user = nil
  end

  #remember a user in a persistent session
  def remember(user)
    #from the user model
    user.remember
    #signing cookies encrypts them
    #create user id and token cookies to be stored in the browser
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end
end
