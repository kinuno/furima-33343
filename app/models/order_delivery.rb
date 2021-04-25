class OrderDelivery
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :housenumber, :building, :telephone, :user_id, :item_id, :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Input correctly' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :housenumber
    validates :telephone, length: { maximum: 11 }, format: { with: /\A[0-9]+\z/, message: 'Input only number' }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Delivery.create(postcode: postcode, prefecture_id: prefecture_id, city: city, housenumber: housenumber, building: building,
                    telephone: telephone, order_id: order.id)
  end
end
