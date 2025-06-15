class RecordsController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @record_address = RecordAddress.new(set_params)
  end

  def create
  end

  private

  def set_params
    params.permit(:post_number, :prefecture_id, :city, :house_number, :building, :phone_number, :record_id, :token).merge(user_id: current_user.id, item_id: @item.id)
  end

end
