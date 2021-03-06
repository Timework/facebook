class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  validates :body, presence: true
  validates :user_id, presence: true
  has_one_attached :image
end
