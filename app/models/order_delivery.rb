class OrderDelivery
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :housenumber, :building, :telephone, :user_id, :item_id

  # with_options presence: true do
  #   validates: バリデーションは後回し

  # end

  def save
    order = Order.create(user_id: user_id, item_id: item_id )
    Delivery.create(postcode: postcode, prefecture_id: prefecture_id, city: city, housenumber: housenumber, building: building, telephone: telephone, order_id: order.id)
  end

end