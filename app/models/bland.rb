class Bland < ApplicationRecord
  has_many :exibitions
  has_many :category_blands
  has_many :categories, through: :category_blands
end
