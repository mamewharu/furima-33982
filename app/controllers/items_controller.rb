class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params) 
  end

  private
  def item_params
    params.require(:item).permit(:name, :text, :category_id, :state_id, :shipping_fee_burden_id, :area_id, :shipping_day_id, :price, :image)
  end
end
