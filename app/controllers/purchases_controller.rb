class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @payment_form = PaymentForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @payment_form = PaymentForm.new(purchase_params)
    if @payment_form.valid?
      pay_item
      @payment_form.save
     return redirect_to root_path  
    else
    render "index"
    end
  end
  private
  def purchase_params
    params.require(:payment_form).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp.api_key = 
      "sk_test_ba755a676720e375eaa7ed0d"
      Payjp::Charge.create(
        amount: @item.price,  
        card: purchase_params[:token],    
        currency: 'jpy'                 
      )
  end
end
