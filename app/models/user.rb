class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # association
  has_many :room_users, dependent: :destroy
  has_many :rooms, through: :room_users, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to_active_hash :sex
  belongs_to_active_hash :age

  # active_storage
  has_one_attached :image

  # validation
  validates :nickname, presence: true
  validates :sex_id, numericality: { other_than: 1 } 
  validates :age_id, numericality: { other_than: 1 } 

end