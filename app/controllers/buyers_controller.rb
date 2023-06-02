class BuyersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :call_item_b, only: :index
  before_action :exhibitor_exit, only: :index
  before_action :sold_out_exit, only: :index

  def index
    @buy_buyer = BuyBuyer.new
  end

  def create
    @buy_buyer = BuyBuyer.new(buy_params)
    if @buy_buyer.valid?
      @buy_buyer.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def buy_params
    params.require(:buy_buyer).permit(:zip_code, :area_id, :city, :address, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id])
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

end
