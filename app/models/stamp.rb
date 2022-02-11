class Stamp < ApplicationRecord
  belongs_to :user
  has_many :comments,dependent: :destroy
  has_one_attached :image

  validates :title, presence: true
  validates :prefecture, presence: true
  validates :place , presence: true
  validates :image, presence: true
end
