# frozen_string_literal: true

# A setting detail is one aspect of a game, such as the planet, the year, etc.
class SettingDetail < ApplicationRecord
  belongs_to :campaign

  has_many :notes, as: :notable
end
