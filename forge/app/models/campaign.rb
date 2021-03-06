# frozen_string_literal: true

# A campaign is the entire story of a game and all its contents
class Campaign < ApplicationRecord
  belongs_to :user

  has_many :setting_details
  has_many :chapters
  has_many :characters
  has_many :items
  has_many :notes, as: :notable

  # Custom Methods
  def chapter_display
    numbered_chapters = {}
    chapter_number = 1
    chapters.each do |chapter|
      numbered_chapters[chapter_number.to_s] = chapter.title
      chapter_number += 1
    end
    numbered_chapters
  end

  def setting_detail_display
    setting_details_full = {}
    setting_details.each do |detail|
      title = detail.title.capitalize
      setting_details_full[title] = detail.description
    end
    setting_details_full
  end

  def available_loot
    all_loot = []
    items.each do |item|
      item_data = {}
      item_data['item'] = item.name
      item_data['gold piece value'] = item.value
      item_data['details'] = item.details unless item.is_cash
      all_loot << item_data
    end
    all_loot
  end

  def gm_characters
    gm_characters = []
    characters.each do |character|
      gm_characters << character if character.user == character.campaign.user
    end
    gm_characters
  end

  def player_characters
    player_characters = []
    characters.each do |character|
      if character.user != character.campaign.user
        player_characters << character
      end
    end
    player_characters
  end
end
