class PurchasesController < ApplicationController
  def index
    @purchase = Payment.new
    @item = Item.find(params[:item_id])
  end
  def create
    @purchase = Payment.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
     return redirect_to root_path  
    else
    render "index"
  end
  private
  def purchase_params
    params.require(:payment).permit(:postal_code, :prefecture_id, :city, :house_number, :builing_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token:params[:token])
  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp.api_key = 
      sk_test_ba755a676720e375eaa7ed0d
      Payjp::Charge.create(
        amount: purchase_params[:price],  
        card: purchase_params[:token],    
        currency: 'jpy'                 
      )
  end
end
