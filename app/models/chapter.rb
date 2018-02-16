class Chapter < ApplicationRecord
  belongs_to :campaign

  has_many :blue_books
  has_many :notes, as: :notable
end
