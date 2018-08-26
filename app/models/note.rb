# frozen_string_literal: true

# A note is a snippet of text that any player can add to any object
class Note < ApplicationRecord
  belongs_to :notable, polymorphic: true
  belongs_to :user
end
