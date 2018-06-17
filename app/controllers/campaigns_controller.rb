# frozen_string_literal: true

class CampaignsController < ApplicationController
  before_action :ensure_logged_in

  def index
    @campaigns = current_user.campaigns
  end

  def show
    @campaign = Campaign.find(params[:id])
    @chapters = @campaign.chapter_display
    @chapter = Chapter.new
    @setting_details = @campaign.setting_detail_display
    @setting_detail = SettingDetail.new
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
    if @campaign.save
      flash[:alert] = 'Camapaign successfully created!'
      redirect_to campaigns_url
    else
      render :new
      flash[:error] = 'There were errors in your campaign creation'
    end
  end

  def update
    @campaign = Campaign.find(params[:id])
    @campaign.user = current_user
    @campaign.title = params[:campaign][:title]
    @campaign.description = params[:campaign][:description]
    if @campaign.save
      flash[:alert] = 'Camapaign successfully updated!'
      redirect_to campaign_url(@campaign)
    else
      render :edit
      flash[:error] = 'There were errors in your campaign update'
    end
  end

  def destroy
    # TODO: Fill this in and add functionality
  end
end
