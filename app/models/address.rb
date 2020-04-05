class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user, optional: true
  validates :zipcode, :municipality, :address, :prefecture, :user, presence: true

end
