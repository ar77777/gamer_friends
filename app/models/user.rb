class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # association
  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to_active_hash :sex
  belongs_to_active_hash :age

  # active_storage
  has_one_attached :image

  # validation
  validates :nickname, :sex_id, :age_id, presence: true, unless: :was_attached?
  validates :sex_id, numericality: { other_than: 1 } 
  validates :age_id, numericality: { other_than: 1 } 

  def was_attached?
    image.attached?
  end
end
