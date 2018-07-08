# frozen_string_literal: true

class Character < ApplicationRecord
  belongs_to :user
  belongs_to :campaign

  has_many :blue_books
  has_many :items
  has_many :notes, as: :notable

  validates :user, uniqueness: {
    scope: :campaign,
    message: 'You already have a character.'
  }, if: :player_is_not_game_master

  def player_is_not_game_master
    campaign.user != user
  end
end
