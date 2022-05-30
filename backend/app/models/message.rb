class Message < ApplicationRecord
  belongs_to :user, inverse_of: :messages
  belongs_to :post, inverse_of: :messages

  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :content, presence: true

  mount_uploader :image, ImageUploader

  has_many :message_likes, dependent: :destroy
end
