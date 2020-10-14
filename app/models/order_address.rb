class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postalcode, :area_id ,:municipality , :housenumber, :building,:telephone ,:token

  with_options presence: true do
    validates :postalcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality , format:  { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :housenumber, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :telephone, format:  { with: /\A0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1})[-)]?\d{4}\z|\A0[5789]0[-]?\d{4}[-]?\d{4}\z/ }
  end

  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postalcode: postalcode, area_id: area_id, municipality: municipality, housenumber: housenumber, building: building, telephone:telephone, order_id:order.id)
  end
end

