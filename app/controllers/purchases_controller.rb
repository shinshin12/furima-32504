class PurchasesController < ApplicationController
  def index
    @purchase = Payment.new
    @item = Item.find(params[:item_id])
  end
  def create
    @order = Payment.new(purchase_params)
    @order.save
    redirect_to root_path
  end
  private
  def purchase_params
    params.require(:payment).permit(:postal_code, :prefecture_id, :city, :house_number, :builing_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
