class Room < ApplicationRecord

  # association
  has_many :room_users
  has_many :users, through: :room_users
  has_many :messages, dependent: :destroy
end