class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #handle a successful save
      log_in @user
      flash[:success] = "Welcome to the App!"
      redirect_to @user
      #is the same as redirect_to user_url(@user), which returns the user id
    else
      render 'new'
    end
  end

private

  def user_params
    #initialization hash
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
