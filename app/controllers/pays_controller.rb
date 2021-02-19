class PaysController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @pay_streetaddress = PayStreetAddress.new
  end
  
  def create
    
    @item = Item.find(params[:item_id])
    
    @pay_streetaddress = PayStreetAddress.new(pay_params)
    if @pay_streetaddress.valid? 
      @pay_streetaddress.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def pay_params
    params.permit(:postal_code, :area_id, :municipalities, :address, :tel).merge(item_id: @item.id , user_id: current_user.id)
  end
end
