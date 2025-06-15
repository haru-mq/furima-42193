class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(set_params)
    if @order_address.valid?
      Payjp.api_key = "sk_test_7fadc983a2aa1211b4f13659"
      Payjp::Charge.create(
        amount:   @item.price,
        card:     set_params[:token],
        currency: "jpy"
      )
      @order_address.save
      redirect_to '/'
    else
      render :index
    end
  end

  private

  def set_params
    params.require(:order_address).permit(:post_number, :prefecture_id, :city, :house_number, :building, :phone_number, :record_id, :token).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

end
