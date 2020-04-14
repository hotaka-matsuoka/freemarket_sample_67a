class Category < ApplicationRecord
  has_many :exibitions
  has_many :category_sizes
  has_many :sizes, through: :category_sizes
  has_many :category_blands
  has_many :blands, through: :category_blands
  has_ancestry
end
