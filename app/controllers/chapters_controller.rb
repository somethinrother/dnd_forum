# frozen_string_literal: true

class ChaptersController < ApplicationController
  # rubocop:disable Metrics/MethodLength
  def create
    @campaign = Campaign.find(params[:campaign_id])
    @chapter = Chapter.new
    @chapter.campaign_id = @campaign.id
    @chapter.title = params[:chapter][:title]
    @chapter.description = params[:chapter][:description]

    if @chapter.save
      respond_to do |format|
        format.html { redirect_to campaign_path(@campaign) }
        format.json { render json: @chapter }
      end
    else
      render json: { errors: @chapter.errors }
    end
  end

  # rubocop:enable Metrics/MethodLength

  def update
    # TODO: Fill this in and add functionality
  end

  def destroy
    # TODO: Fill this in and add functionality
  end
end
