# frozen_string_literal: true

# Blue books are player-generated content. Pictures, stories, anything
class BlueBook < ApplicationRecord
  belongs_to :chapter
  belongs_to :character

  has_many :notes, as: :notable
end
