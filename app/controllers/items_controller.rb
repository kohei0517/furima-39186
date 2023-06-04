class ItemsController < ApplicationController
  before_action :go_signin ,only: :new
  before_action :call_item, only: [ :show, :edit, :update, :destroy]
  before_action :equal_user, only: [ :edit, :destroy ]
  before_action :sold_out_exit, only: :edit

  def index
    @items = Item.all.order("created_at DESC")
    @buys  = Buy.all
  end

  def new
    @item = Item.new
  end

  def show
    @buy = Buy.where(item_id: @item.id)
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    Item.delete(params[:id])
    redirect_to root_path
  end

  private

  def call_item
    @item = Item.find(params[:id])
  end
  
  def item_params
    params.require(:item).permit(:title, :description, :category_id, :state_id, :payed_id, :area_id, :progress_id, :price, :image).merge(user_id: current_user.id)
  end

  def go_signin
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def equal_user
    unless current_user.id == @item.user.id
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
