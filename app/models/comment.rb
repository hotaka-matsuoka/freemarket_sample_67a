class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :exhibition
  validates :content, presence: true
end
