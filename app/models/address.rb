class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user, optional: true


  VALID_ZIPCODE_REGEX = /\A\d{7}\z/
  VALID_ADDRESS_REGEX = /\A[ぁ-んァ-ン一-龥]/
  VALID_TEL_REGEX = /\A\d{11}\z/
  validates :zipcode,                                presence: true, format: { with: VALID_ZIPCODE_REGEX }
  validates :municipality, :address,                 presence: true, format: { with: VALID_ADDRESS_REGEX }
  validates :building_name,                                          format: { with: VALID_ADDRESS_REGEX }, allow_blank: true
  validates :tel,                                                    format: { with: VALID_TEL_REGEX }    , allow_blank: true

end