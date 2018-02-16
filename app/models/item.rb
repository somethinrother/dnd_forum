class Item < ApplicationRecord
  belongs_to :campaign
  belongs_to :character, optional: true

  has_many :notes, as: :notable
end
