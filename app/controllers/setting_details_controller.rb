# frozen_string_literal: true

# Controls setting_details actions
class SettingDetailsController < ApplicationController
  def index
    @campaign = Campaign.find(params[:campaign_id])
    @setting_details = @campaign.setting_detail_display
    @setting_detail = SettingDetail.new
  end

  def create
    @campaign = Campaign.find(params[:campaign_id])
    @setting_detail = SettingDetail.new
    @setting_detail.campaign_id = @campaign.id
    @setting_detail.title = params[:setting_detail][:title]
    @setting_detail.description = params[:setting_detail][:description]

    if @setting_detail.save
      respond_to do |format|
        format.html { redirect_to campaign_path(@campaign) }
        format.json { render json: @setting_detail }
      end
    else
      render json: { errors: @setting_detail.errors }
    end
  end

  def update
    # TODO: Fill this in and add functionality
  end

  def destroy
    # TODO: Fill this in and add functionality
  end
end
