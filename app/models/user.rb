class User < ApplicationRecord
  has_secure_password

  has_many :campaigns
  has_many :characters
  has_many :notes, as: :notable
end
