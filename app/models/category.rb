class Category < ApplicationRecord
  has_many :exibitions
  has_many :category_sizes
  has_many :sizes, through: :category_sizes
  has_many :category_brands
  has_many :brands, through: :category_brands
  has_ancestry
end
