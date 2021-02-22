class PaysController < ApplicationController
  before_action :move_toppage, only: :index

  def index
    @item = Item.find(params[:item_id])
    @pay_streetaddress = PayStreetAddress.new
     if current_user == @item.user
      redirect_to root_path
     end
  end
  
  def create
    @item = Item.find(params[:item_id])
    @pay_streetaddress = PayStreetAddress.new(pay_params)
    if @pay_streetaddress.valid? 
       crdit
      @pay_streetaddress.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def pay_params
    params.require(:pay_street_address).permit(:postal_code, :area_id, :municipalities, :address, :tel).merge(item_id: @item.id , user_id: current_user.id, item_price: @item.price, token: params[:token])
  end

  def crdit
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
       Payjp::Charge.create(
       amount: @item.price,
       card:   pay_params[:token],
       currency: 'jpy' )
  end

  def move_toppage
    redirect_to root_path unless current_user 
  end

end
