class Comment < ApplicationRecord
  validates :content, presence: true
  belongs_to :stamp
  belongs_to :user
end
