class OrderAddress

  include ActiveModel::Model
  attr_accessor :firstname, :familyname, :postal_code, :area_id :municipality , :city, :house_number, :building_name,:telephone
  # ここにバリデーションの処理を書く

  def save
  # 各テーブルにデータを保存する処理を書く
  end
end