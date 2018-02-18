class Campaign < ApplicationRecord
  belongs_to :user

  has_many :setting_details
  has_many :chapters
  has_many :characters
  has_many :items
  has_many :notes, as: :notable

  # Custom Methods
  def chapter_display
    numbered_chapters = []
    chapter_number = 1
    chapters.map do |chapter|
      chapter = {chapter_number => chapter.title}
      numbered_chapters << chapter
      chapter_number += 1
    end
    numbered_chapters
  end
end
