class RoomUser < ApplicationRecord
  # association
  belongs_to :room
  belongs_to :user
end
