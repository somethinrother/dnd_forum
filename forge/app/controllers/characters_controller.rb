# frozen_string_literal: true

# Controls character actions
class CharactersController < ApplicationController
  def index; end

  def show
    @campaign = Campaign.find(params[:campaign_id])
    @character = Character.find(params[:id])
  end

  def new
    @campaign = Campaign.find(params[:campaign_id])
    @character = Character.new
  end

  def edit
    @campaign = Campaign.find(params[:campaign_id])
    @character = Character.find(params[:id])
  end

  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/AbcSize
  def create
    @character = Character.new
    @character.user_id = current_user.id
    @character.campaign_id = params[:campaign_id]
    @character.name = params[:character][:name]
    @character.description = params[:character][:description]
    @character.primary_class = params[:character][:primary_class]
    @character.secondary_class = params[:character][:secondary_class]
    @character.tertiary_class = params[:character][:tertiary_class]
    @character.location = params[:character][:location]
    @character.level = params[:character][:level]
    @character.copper = params[:character][:copper]
    @character.silver = params[:character][:silver]
    @character.gold = params[:character][:gold]
    @character.platinum = params[:character][:platinum]
    @character.experience = params[:character][:experience]
    if @character.save
      flash[:alert] = 'Character successfully created!'
      redirect_to campaign_url(@character.campaign)
    else
      render :new
      flash[:error] = 'There were errors in your character creation'
    end
  end

  def update
    @character = Character.find(params[:id])
    @character.user_id = current_user.id
    @character.campaign_id = params[:campaign_id]
    @character.name = params[:character][:name]
    @character.description = params[:character][:description]
    @character.primary_class = params[:character][:primary_class]
    @character.secondary_class = params[:character][:secondary_class]
    @character.tertiary_class = params[:character][:tertiary_class]
    @character.location = params[:character][:location]
    @character.level = params[:character][:level]
    @character.copper = params[:character][:copper]
    @character.silver = params[:character][:silver]
    @character.gold = params[:character][:gold]
    @character.platinum = params[:character][:platinum]
    @character.experience = params[:character][:experience]
    if @character.save
      flash[:alert] = 'Character successfully updated!'
      redirect_to campaign_character_url(@character.campaign)
    else
      render :edit
      flash[:error] = 'There were errors in your character update'
    end
  end
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/AbcSize

  def destroy
    # TODO: Fill this in and add functionality
  end
end
