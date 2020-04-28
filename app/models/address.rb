class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user, optional: true


  VALID_ZIPCODE_REGEX = /\A\d{7}\z/
  VALID_ADDRESS_REGEX = /\A[ぁ-んァ-ン一-龥]/
  VALID_TEL_REGEX =  /\A0[7-9]0-?\d{4}-?\d{4}\z/
  validate  :zipcode_error
  validate  :municipality_error
  validate  :address_error
  validates :building_name, format: { with: VALID_ADDRESS_REGEX }, allow_blank: true
  validates :tel,           format: { with: VALID_TEL_REGEX }    , allow_blank: true

  def zipcode_error
    if zipcode.blank?
      errors.add(:zipcode, 'を入力してください')
    elsif zipcode.match(VALID_ZIPCODE_REGEX) == nil
      errors.add(:zipcode, 'を半角数字で入力してください')
    end
  end
  def municipality_error
    if municipality.blank?
      errors.add(:municipality, 'を入力してください')
    elsif municipality.match(VALID_ADDRESS_REGEX) == nil
      errors.add(:municipality, 'は不正な値です')
    end
  end
  def address_error
    if address.blank?
      errors.add(:address, 'を入力してください')
    elsif address.match(VALID_ADDRESS_REGEX) == nil
      errors.add(:address, 'は不正な値です')
    end
  end

end