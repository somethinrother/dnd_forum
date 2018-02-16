class Character < ApplicationRecord
  belongs_to :user
  belongs_to :campaign

  has_many :blue_books
  has_many :items
end
