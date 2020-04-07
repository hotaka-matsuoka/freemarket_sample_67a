class Exibition < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy
  validates :name,        length: { maximum:40 }
  validates :explanation, length: { maximum:1000 }

end
