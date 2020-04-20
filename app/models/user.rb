class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         
  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  VALID_NAME_REGEX = /\A[一-龥ぁ-ん]/
  VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :nickname,                           presence: true, length: { maximum:20 }
  validates :email,                              uniqueness: true
  validate  :email_error
  validate  :family_name_error
  validate  :first_name_error
  validate  :family_name_kana_error
  validate  :first_name_kana_error
  validates :birth_day,                          presence: true

  has_one :address, dependent: :destroy
  has_one :card

  def email_error
    if email.blank?
        errors.add(:email, 'メールアドレスを入力してください')
    elsif email.match(VALID_EMAIL_REGEX) == nil
        errors.add(:email, 'のフォーマットが不適切です')
    end
  end
  def family_name_error
    if family_name.blank?
      errors.add(:family_name, 'を入力してください')
    elsif family_name.match(VALID_NAME_REGEX) == nil
      errors.add(:family_name, 'を全角で入力してください')
    end
  end
  def first_name_error
    if first_name.blank?
      errors.add(:first_name, 'を入力してください')
    elsif first_name.match(VALID_NAME_REGEX) == nil
      errors.add(:first_name, 'を全角で入力してください')
    end
  end
  def family_name_kana_error
    if family_name_kana.blank?
      errors.add(:family_name_kana, 'を入力してください')
    elsif family_name_kana.match(VALID_NAME_KANA_REGEX) == nil
      errors.add(:family_name_kana, 'を全角で入力してください')
    end
  end
  def first_name_kana_error
    if first_name_kana.blank?
      errors.add(:first_name_kana, 'を入力してください')
    elsif first_name_kana.match(VALID_NAME_KANA_REGEX) == nil
      errors.add(:first_name_kana, 'を全角で入力してください')
    end
  end

end