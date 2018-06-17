# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  config.time_zone = 'Eastern Time (US & Canada)'
  around_action :set_time_zone

  helper_method :current_user, :logged_in?

  def current_user
    session[:user_id] && User.find(session[:user_id])

    User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user != nil
  end

  private

  def ensure_logged_in
    return true if current_user
    flash[:alert] = 'Please log in first.'
    redirect_to login_url
  end

  def set_time_zone
    Time.use_zone('EST') { yield }
  end
end
