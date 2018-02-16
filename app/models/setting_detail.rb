class SettingDetail < ApplicationRecord
  belongs_to :campaign

  has_many :notes, as: :notable
end
