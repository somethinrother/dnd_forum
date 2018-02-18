class SettingDetailsController < ApplicationController
  def create
    @campaign = Campaign.find(params[:campaign_id])
    @setting_detail = SettingDetail.new
    @setting_detail.campaign_id = params[:setting_detail][:campaign_id]
    @setting_detail.title = params[:setting_detail][:title]
    @setting_detail.description = params[:setting_detail][:description]

    if @setting_detail.save
      respond_to do |format|
        format.html {redirect_to campaign_path(@campaign[:campaign_id])}
        format.json {render json: @setting_detail}
      end
    else
      render json: {:errors => @setting_detail.errors}
    end
  end

  def update
  end

  def destroy
  end
end
