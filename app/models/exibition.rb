class Exibition < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :size
  belongs_to :bland
  has_many  :images, dependent: :destroy 
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :name,        length: { maximum:40 }
  validates :explanation, length: { maximum:1000 }

end
