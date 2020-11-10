class Post < ApplicationRecord
  # association
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  #いいね機能
  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

  # validation
  validates :game_title, :platform, :time_zone, :call, presence: true
  validates :text, length:{ maximum: 100 }
end