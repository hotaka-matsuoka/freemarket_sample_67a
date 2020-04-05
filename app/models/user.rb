class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,                           presence: true, length: { maximum:20 }
  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :email,                              presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  VALID_NAME_REGEX = /\A[一-龥ぁ-ん]/
  validates :family_name, :first_name,           presence: true, format: { with: VALID_NAME_REGEX }
  VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :family_name_kana, :first_name_kana, presence: true, format: { with: VALID_NAME_KANA_REGEX }
  validates :birth_day,                          presence: true

  has_one :address, dependent: :destroy
end