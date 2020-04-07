class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         
  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  VALID_NAME_REGEX = /\A[一-龥ぁ-ん]/
  VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :nickname,                           presence: true, length: { maximum:20 }
  validates :email,                              presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  validates :family_name, :first_name,           presence: true, format: { with: VALID_NAME_REGEX }
  validates :family_name_kana, :first_name_kana, presence: true, format: { with: VALID_NAME_KANA_REGEX }
  validates :birth_day,                          presence: true

  has_one  :address, dependent: :destroy
  has_many :exibitions
end