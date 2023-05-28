class ItemsController < ApplicationController
  before_action :go_signin ,only: :new
  before_action :need_signed_in, only: :edit

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
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
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(params[:id])
    else
      render :edit
    end
  end

  private
  
  def item_params
    params.require(:item).permit(:title, :description, :category_id, :state_id, :payed_id, :area_id, :progress_id, :price, :image).merge(user_id: current_user.id)
  end

  def go_signin
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def need_signed_in
    @item = Item.find(params[:id])
    unless user_signed_in? && current_user.id == @item.user.id
      redirect_to root_path
    end
  end
end
