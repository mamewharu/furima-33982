class ItemsController < ApplicationController
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :state_id, :shipping_fee_burden_id, :area_id, :shipping_day_id,
                                 :price, :image).merge(user_id: current_user.id)
  end
end
