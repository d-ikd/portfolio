class Post < ApplicationRecord
  validates :name, presence: true
  # , uniqueness: { case_sensitive: true }
  # validates :calorie, presence: true
  # validates :carbonhydrate, presence: true
  # validates :protein, presence: true
  # validates :lipid, presence: true
  # validates :details, presence: true
  # validates :maker, presence: true
  # validates :category, presence: true
  # validates :price, presence: true

  mount_uploader :image, ImageUploader

  has_many :post_likes, dependent: :destroy
  has_many :like_users, through: :post_likes, source: :user
  has_many :reviews, dependent: :destroy
  has_many :choise_posts, dependent: :destroy
  has_many :pickups, dependent: :destroy
  has_many :recommends, dependent: :destroy

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
