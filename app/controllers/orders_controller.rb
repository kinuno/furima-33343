class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_delivery = OrderDelivery.new
  end

  def create
    @order_delivery = OrderDelivery.new(order_params)
    if @order_delivery.valid?
      @order_delivery.save
      redirect_to root_path
    else 
      render action: :index
    end
  end

  private

  def order_params
    params.require(:order_delivery).permit(:postcode, :prefecture_id, :city, :housenumber, :building, :telephone, :order_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
