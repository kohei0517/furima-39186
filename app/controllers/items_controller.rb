class ItemsController < ApplicationController
  before_action :go_signin ,only: :new
  before_action :call_item, only: [ :show, :edit, :update]
  before_action :equal_user, only: :edit

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def show
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
end
