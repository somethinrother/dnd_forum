# frozen_string_literal: true

# A user can be either a game master or a player, depending on the campaign
class User < ApplicationRecord
  has_secure_password

  has_many :campaigns
  has_many :characters
  has_many :notes
end
