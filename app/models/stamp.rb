class Stamp < ApplicationRecord
  belongs_to :user
  has_many :comments,dependent: :destroy
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  validates :title, presence: true
  #validates :prefecture, presence: true
  validates :place , presence: true
  validates :image, presence: true
  validates :prefecture_id, numericality: { other_than: 1,message: "can't be blank" } 
end
