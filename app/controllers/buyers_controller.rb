class BuyersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :call_item_b, only: [:index, :create]
  before_action :exhibitor_exit, only: :index
  before_action :sold_out_exit, only: :index

  def index
    @buy_buyer = BuyBuyer.new
  end

  def create
    @buy_buyer = BuyBuyer.new(buy_params)
    if @buy_buyer.valid?
      pay_item
      @buy_buyer.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def buy_params
    params.require(:buy_buyer).permit(:zip_code, :area_id, :city, :address, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token], price: @item.price)
  end

  def call_item_b
    @item = Item.find(params[:item_id])
  end

  def exhibitor_exit
    if current_user.id == @item.user.id
      redirect_to root_path
    end
  end

  def sold_out_exit
    @buy = Buy.where(item_id: @item.id)
    unless @buy == []
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: buy_params[:price],
      card: buy_params[:token],
      currency: 'jpy' 
    )
  end

end
