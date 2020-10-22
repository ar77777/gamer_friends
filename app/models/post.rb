class Post < ApplicationRecord
  # association
  belongs_to :user
  has_many :posts, dependent: :destroy
end
