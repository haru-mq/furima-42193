class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(set_params)
    if @order_address.valid?
      @order_address.save
      redirect_to '/'
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def set_params
    params.require(:order_address).permit(:post_number, :prefecture_id, :city, :house_number, :building, :phone_number, :record_id, :token).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
