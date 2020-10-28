class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # association
  has_many :posts
  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  # active_storage
  has_one_attached :image

  validates :nickname, :sex_id, :age_id, presence: true, unless: :was_attached?

  def was_attached?
    image.attached?
  end
end
