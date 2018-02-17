class UsersController < ApplicationController
  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def update
  end

  def create
    @user = User.new
    @user.email = params[:user][:email]
    @user.username = params[:user][:username]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save
      # # Auto-login on succesful signup
      flash[:alert] = 'Account successfully created!'
      session[:user_id] = @user.id
      cookies[:user_id] = @user.id
      redirect_to campaigns_url
    else
      render :new
      flash[:error] = 'There were errors in your account creation'
    end
  end

  def destroy
  end
end
