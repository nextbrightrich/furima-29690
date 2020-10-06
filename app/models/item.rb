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

  # ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: {other_than: 1 } do
  validates :category_id
  validates :status_id
  validates :burden_id
  validates :area_id
  validates :day_id
  end

  validates_inclusion_of :price, in: 300..9_999_999

end

