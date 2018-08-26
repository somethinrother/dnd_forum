# frozen_string_literal: true

# Controls campaign actions
class CampaignsController < ApplicationController
  before_action :ensure_logged_in

  def index
    @campaigns = current_user.campaigns
  end

  def show
    @campaign = Campaign.find(params[:id])
    @chapters = @campaign.chapter_display
    @chapter = Chapter.new
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
    assign_campaign_details
    if @campaign.save
      flash[:alert] = 'Campaign successfully created!'
      redirect_to campaigns_url
    else
      render :new
      flash[:error] = 'There were errors in your campaign creation'
    end
  end

  def update
    assign_campaign_details
    if @campaign.save
      flash[:alert] = 'Campaign successfully updated!'
      redirect_to campaign_url(@campaign)
    else
      render :edit
      flash[:error] = 'There were errors in your campaign update'
    end
  end

  def destroy
    # TODO: Fill this in and add functionality
  end

  private

  def assign_campaign_details
    @campaign = params[:id] ? Campaign.find(params[:id]) : Campaign.new
    @campaign.user = current_user
    @campaign.title = params[:campaign][:title]
    @campaign.description = params[:campaign][:description]
  end
end
