class RecordsController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @record_address = RecordAddress.new
  end

  def create
    @record_address = RecordAddress.new(set_params)
    if @record_address.valid?
      @record_address.save
      redirect_to '/'
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def set_params
    params.require(:record_address).permit(:post_number, :prefecture_id, :city, :house_number, :building, :phone_number, :record_id, :token).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
