class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # association
  has_many :posts

  # active_storage
  has_one_attached :image

  validates :nickname, :sex_id, :age_id, presence: true, unless: :was_attached?

  def was_attached?
    image.attached?
  end
end
