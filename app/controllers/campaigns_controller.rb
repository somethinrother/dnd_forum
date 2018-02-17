class CampaignsController < ApplicationController
  before_action :ensure_logged_in

  def index
    if current_user
      @campaigns = current_user.campaigns.all
    else
      redirect_to login_url
    end
  end

  def show
    @campaign = Campaign.find(params[:id])
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
