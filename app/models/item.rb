class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :burden
  belongs_to_active_hash :area
  belongs_to_active_hash :days

    #空の投稿を保存できないようにする　
    validates :title, :text, presence: true

    #ジャンルの選択が「--」の時は保存できないようにする一旦categoのみ
    validates :category＿id , numericality: { other_than: 1 } 
end
