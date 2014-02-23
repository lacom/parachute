class UsersController < ApplicationController
  
  before_action :authorize, except: [:index, :sign_in_as]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to "/users"
    else
      render :new
    end
  end

  def sign_in_as
    session[:user_id] = params[:id]

    redirect_to "/posts"
  end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end

end