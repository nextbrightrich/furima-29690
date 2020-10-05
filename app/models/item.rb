class Item < ApplicationRecord
  belongs_to :user
  has_one :customer
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :burden
  belongs_to_active_hash :area
  belongs_to_active_hash :day

  # 空の投稿を保存できないようにする
  validates :name, :price, :description, :image, :price, :category, :status, :burden, :burden, :area, :day, presence: true

  # ジャンルの選択が「--」の時は保存できないようにする一旦categoのみ
  with_options presence: true do
  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :burden_id, numericality: { other_than: 1 }
  validates :area_id, numericality: { other_than: 1 }
  validates :day_id, numericality: { other_than: 1 }

  validates_inclusion_of :price, in: 300..9_999_999
  end

end

