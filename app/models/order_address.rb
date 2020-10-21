class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postalcode, :area_id, :municipality, :housenumber, :building, :telephone, :token

  with_options presence: true do
    validates :postalcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :municipality
    validates :housenumber
    validates :telephone, format: { with: /\A0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1})[-)]?\d{4}\z|\A0[5789]0[-]?\d{4}[-]?\d{4}\z/ }
    validates :token
  end

  validates :area_id, numericality: { other_than: 1 }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postalcode: postalcode, area_id: area_id, municipality: municipality, housenumber: housenumber, building: building, telephone: telephone, order_id: order.id)
  end
end
