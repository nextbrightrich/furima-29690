class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: '英字と数字の両方を含めて設定してください' 

  validates :firstname, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ ,message: '名字を全角（漢字・ひらがな・カタカナ）で入力下さい'}
  validates :familyname, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ ,message: '名前を全角（漢字・ひらがな・カタカナ）で入力下さい'}
  validates :firstnamekana, presence: true, format: { with: /\A[ァ-ン]+\z/ ,message: '名字を全角（カタカナ）で入力下さい'} 
  validates :familynamekana, presence: true, format: { with: /\A[ァ-ン]+\z/ ,message: '名前を全角（カタカナ）で入力下さい'}
  validates :birthday, presence: true

end
