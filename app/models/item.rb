class Item < ApplicationRecord
   belongs_to :user
   has_one : customer
   has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :burden
  belongs_to_active_hash :area
  belongs_to_active_hash :days

  #商品名と価格が空の投稿を保存できないようにする 
  validates :name, :price, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする一旦categoのみ
  validates :category＿id , numericality: { other_than: 1 } 
  validates :status_id , numericality: { other_than: 1 } 
  validates :burden_id , numericality: { other_than: 1 } 
  validates :area_id , numericality: { other_than: 1 } 
  validates :days_id , numericality: { other_than: 1 } 
end
