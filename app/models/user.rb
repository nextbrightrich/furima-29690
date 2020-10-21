class User < ApplicationRecord
  has_many :items
  has_many :orders

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: '英字と数字の両方を含めて設定してください'

  with_options presence: true do
    validates :firstname, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :familyname, format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :firstnamekana, format: { with: /\A[ァ-ヶー－]+\z/}
    validates :familynamekana, format: { with: /\A[ァ-ヶー－]+\z/}
    validates :birthday
  end
end
