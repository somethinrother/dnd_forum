# frozen_string_literal: true

# An item is any piece of gear or treasure
class Item < ApplicationRecord
  belongs_to :campaign
  belongs_to :character, optional: true

  has_many :notes, as: :notable
end
