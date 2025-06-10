class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new, :create

  def index
  end

  def new
    @item = Item.new
  end

  def create
    if Item.create(item_params)
      redirect_to '/'
    else
      render :new, status :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item_name).permit(:item_description, :category_id, :condition_id, :fee_id, :prefecture_id, :ship_date_id, :price, :image).merge(user_id: current_user.id)
  end
end
