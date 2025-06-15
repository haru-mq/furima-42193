class RecordsController < ApplicationController

  def index
    @address = Address.new
    @item = Item.find(params[:id])
  end

  def create
  end

end
