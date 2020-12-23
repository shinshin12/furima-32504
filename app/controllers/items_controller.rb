class ItemsController < ApplicationController
  before_action :move_action, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :move_to_index, only: [:edit]
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
  def show
  end
  def edit
  end
  def update
   if @item.update(item_params)
    redirect_to item_path
   else
    render :edit
   end
  end
  def destroy
    @item.destroy
    redirect_to root_path
  end

  private
  def move_action
    @item = Item.find(params[:id])
  end
  def item_params
    params.require(:item).permit(:item_name, :explanation, :price, :category_id, :state_id, :shipping_method_id, :prefecture_id, :day_time_id, :image).merge(user_id: current_user.id)
  end
  def move_to_index
     unless user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
 end
end
