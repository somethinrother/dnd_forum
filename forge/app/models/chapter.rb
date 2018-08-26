# frozen_string_literal: true

# A chapter is one meaningful segment of the larger story of the campaign
class Chapter < ApplicationRecord
  belongs_to :campaign

  has_many :blue_books
  has_many :notes, as: :notable
end
