class BlueBook < ApplicationRecord
  belongs_to :chapter
  belongs_to :character

  has_many :notes, as: :notable
end
