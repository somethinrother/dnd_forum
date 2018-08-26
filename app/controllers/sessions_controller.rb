# frozen_string_literal: true

# Controls the creation and removal of session details
class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      user_id = user.id
      session[:user_id] = user_id
      redirect_to campaigns_url, notice: 'Logged in!'
      cookies[:user_id] = user_id
    else
      flash.now[:notice] = 'Username or password is not correct.'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    cookies[:user_id] = nil
    redirect_to login_url, notice: 'Logged out!'
  end
end
