class PaysController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_pay, only: [:index, :create]
  before_action :move_toppage, only: :index

  def index
    @pay_streetaddress = PayStreetAddress.new
  end

  def create
    @pay_streetaddress = PayStreetAddress.new(pay_params)
    if @pay_streetaddress.valid?
      crdit
      @pay_streetaddress.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def pay_params
    params.require(:pay_street_address).permit(:postal_code, :area_id, :municipalities, :address, :tel).merge(
      item_id: @item.id, user_id: current_user.id, item_price: @item.price, token: params[:token]
    )
  end

  def crdit
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: pay_params[:token],
      currency: 'jpy'
    )
  end

  def move_toppage
    redirect_to root_path if current_user == @item.user
  end

  def set_pay
    @item = Item.find(params[:item_id])
  end
end
