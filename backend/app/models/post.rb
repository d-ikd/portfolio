class Post < ApplicationRecord
  # before_save :write_width_height
  mount_uploader :photoshot, PhotoshotUploader
  mount_uploader :image, ImageUploader

  validates :name, presence: true
  # validates :name, presence: true, uniqueness: { case_sensitive: true }
  validates :details, presence: false
  validates :quickword, presence: false
  validates :catchcopy, presence: false
  validates :start_time, presence: false
  validates :finish_time, presence: false
  validates :member, presence: false
  validates :place, presence: false
  validates :price, presence: false
  validates :category, presence: false

  has_many :post_likes, dependent: :destroy
  has_many :like_users, through: :post_likes, source: :user

  has_many :post_joins, dependent: :destroy
  has_many :join_users, through: :post_joins, source: :user

  has_many :reviews, dependent: :destroy
  has_many :pickups, dependent: :destroy


  def avg_rate
    if self.reviews.empty?
      0.0
    else
      # self.reviews.average(:rate).round(1)
      total_point = self.reviews.inject(0) { |sum, add| sum + add.rate }
      number_of_people = self.reviews.inject(0) { |sum| sum + 1 }.to_f
      total_point / number_of_people
    end
  end

  def self.search(post_name)
    Post.where(['name LIKE ?', "%#{post_name}%"])
  end
end
