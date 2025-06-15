class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :redirect_if_owner, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_address = OrderAddress.new
  end

  def create
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

  def set_item
    @item = Item.find(params[:item_id])
  end

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

  def redirect_if_owner
    if current_user.id == @item.user_id
      redirect_to '/'
    end
  end

end
