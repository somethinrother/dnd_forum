# frozen_string_literal: true

# Controls setting_details actions
class SettingDetailsController < ApplicationController
  def index
    @campaign = Campaign.find(params[:campaign_id])
    @setting_details = @campaign.setting_detail_display
    @setting_detail = SettingDetail.new
  end

  def create
    assign_setting_detail_attrs
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

  private

  def assign_setting_detail_attrs
    @campaign = Campaign.find(params[:campaign_id])
    @setting_detail = SettingDetail.new
    @setting_detail.campaign_id = @campaign.id
    @setting_detail.title = params[:setting_detail][:title]
    @setting_detail.description = params[:setting_detail][:description]
  end
end
