class Item < ApplicationRecord
  belongs_to :campaign
  belongs_to :character, optional: true
end
