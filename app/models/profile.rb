class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :name, presence: true
  validates :about, presence: true
end
