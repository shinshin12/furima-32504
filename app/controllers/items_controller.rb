class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
  @items = Item.all.order(created_at: :desc)
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

  private
  def item_params
    params.require(:item).permit(:item_name, :explanation, :price, :category_id, :state_id, :shipping_method_id, :prefecture_id, :day_time_id, :image).merge(user_id: current_user.id)
  end
end
