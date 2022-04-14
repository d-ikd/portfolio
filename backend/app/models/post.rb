class Post < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: true }

  mount_uploader :image, ImageUploader

  has_many :post_likes, dependent: :destroy
  has_many :like_users, through: :post_likes, source: :user
  has_many :reviews, dependent: :destroy
  has_many :pickups, dependent: :destroy
  has_many :recommends, dependent: :destroy

  def self.search(food_name)
    Post.where(['name LIKE ?', "%#{post_name}%"])
  end

end
