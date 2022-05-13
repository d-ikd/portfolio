class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  mount_uploader :image, ImageUploader

  has_many :post_likes, dependent: :destroy
  has_many :postlike, through: :post_likes, source: :post

  has_many :post_joins, dependent: :destroy
  has_many :postjoin, through: :post_joins, source: :post

  has_many :reviews, dependent: :destroy

  has_many :review_likes, dependent: :destroy
  has_many :like_reviews, through: :review_likes, source: :review

  has_many :relationships, dependent: :destroy
  has_many :followings, through: :relationships, source: :follow
  has_many :reverses_of_relationship, class_name: 'Relationship', foreign_key: 'follow_id', dependent: :destroy, inverse_of: :follow
  has_many :followers, through: :reverses_of_relationship, source: :user

  def unjoin(other_post)
    join = self.post_joins.find_by(post_id: other_post.id)
    join&.destroy if join
  end

  def unlike(other_post)
    like = self.post_likes.find_by(post_id: other_post.id)
    like&.destroy if like
  end

  def un_like_review(other_review)
    like = self.review_likes.find_by(review_id: other_review.id)
    like&.destroy if like
  end

  def follow(other_user)
    self.relationships.find_or_create_by(follow_id: other_user.id) unless self == other_user
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship&.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end

  def self.search(user_name)
    User.where(['name LIKE ?', "%#{user_name}%"])
  end
end
