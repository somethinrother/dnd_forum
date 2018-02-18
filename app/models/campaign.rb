class Campaign < ApplicationRecord
  belongs_to :user

  has_many :setting_details
  has_many :chapters
  has_many :characters
  has_many :items
  has_many :notes, as: :notable

  # Custom Methods
  def chapter_display
    numbered_chapters = {}
    chapter_number = 1
    chapters.each do |chapter|
      numbered_chapters[chapter_number.to_s] = chapter.title
      chapter_number += 1
    end
    numbered_chapters
  end

  def setting_detail_display
    setting_details_full = {}
    setting_details.each do |detail|
      setting_details_full[detail.title.capitalize] = detail.description.capitalize
    end
    setting_details_full
  end
end
