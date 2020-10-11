class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #association
  has_many :posts

  #active_storage
  has_one_attached :image

  validates :nickname, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end
