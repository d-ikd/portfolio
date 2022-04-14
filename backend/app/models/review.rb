class Review < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :content, presence: true

  mount_uploader :image, ImageUploader

  has_many :review_likes, dependent: :destroy
end
