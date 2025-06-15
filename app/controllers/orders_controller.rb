class OrdersController < ApplicationController
  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(set_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to '/'
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index
    end
  end

  private

  def set_params
    params.require(:order_address).permit(:post_number, :prefecture_id, :city, :house_number, :building, :phone_number, :record_id, :token).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount:   @item.price,
      card:     set_params[:token],
      currency: "jpy"
    )
  end

end
