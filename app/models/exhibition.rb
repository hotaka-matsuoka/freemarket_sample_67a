class Exhibition < ApplicationRecord

  belongs_to :user
  belongs_to :category
  belongs_to :size
  has_many  :images, dependent: :destroy 
  accepts_nested_attributes_for :images, allow_destroy: true
  enum sales_status:    { on_sale: 0, sold_out: 1 }
  validates :name,        presence: true, length: { maximum:40 }
  validates :explanation, presence: true, length: { maximum:1000 }
  validates :price,       numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 1000000 }
  validates :price, :shipping_method_id, :shipping_date_id, :condition_id, :prefecture_id, :category_id, :user_id, presence: true
  validates_associated :images
  validates :images, presence: true
  validate :images_size_validate

  IMAGE_MAX = 10
  def images_size_validate
    errors.add(:images, "枚数オーバー") if self.images.size > IMAGE_MAX
  end



end
