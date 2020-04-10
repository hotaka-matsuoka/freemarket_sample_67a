class Exhibition < ApplicationRecord
  belongs_to :user
  has_many  :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :name,        length: { maximum:40 }
  validates :explanation, length: { maximum:1000 }

end
