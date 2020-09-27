class User < ApplicationRecord
  @user =User.new
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         :confirmable

  has_many :items
  has_many :customers
end