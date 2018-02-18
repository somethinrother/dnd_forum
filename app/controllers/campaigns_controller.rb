class CampaignsController < ApplicationController
  before_action :ensure_logged_in

  def index
    @campaigns = current_user.campaigns
  end

  def show
    @campaign = Campaign.find(params[:id])
    @chapters = @campaign.chapter_display
    @setting_details = @campaign.setting_detail_display
    @setting_detail = SettingDetail.new
    @loot = @campaign.available_loot
    @player_characters = @campaign.player_characters
    @gm_characters = @campaign.gm_characters
  end

  def new
    @campaign = Campaign.new
  end

  def edit
    @campaign = Campaign.find(params[:id])
  end

  def create
    @campaign = Campaign.new
    @campaign.user = current_user
    @campaign.title = params[:campaign][:title]
    @campaign.description = params[:campaign][:description]
    if params[:campaign][:experience_track] == '1'
      @campaign.experience_track = 'Slow'
    elsif params[:campaign][:experience_track] == '2'
      @campaign.experience_track = 'Medium'
    elsif params[:campaign][:experience_track] == '3'
      @campaign.experience_track = 'Fast'
    end

    if @campaign.save
      flash[:alert] = 'Camapaign successfully created!'
      redirect_to campaigns_url
    else
      render :new
      flash[:error] = 'There were errors in your campaign creation'
    end
  end

  def update
  end

  def destroy
  end
end
