class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :image, dependent: :destroy
  validates :name, presence: true
  validates :about, presence: true
end
