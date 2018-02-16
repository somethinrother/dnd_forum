class Campaign < ApplicationRecord
  belongs_to :user

  has_many :setting_details
end
