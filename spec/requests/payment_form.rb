require 'rails_helper'
RSpec.describe PaymentForm, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
    @payment_form = FactoryBot.build(:payment_form, user_id: @user.id, item_id: @item.id)
  end
  describe '購入機能' do
    context '購入機能がうまくいく時' do
     it 'tokenと,postal_code,phone_number,prefecture_id,city,house_numberが存在すれば登録できる' do
         expect(@payment_form).to be_valid
     end
    end

     context "購入機能がうまくいかない時" do
      it "tokenが空だとうまくいかない" do
          @payment_form.token = ""
          @payment_form.valid?
          expect(@payment_form.errors.full_messages).to include("Token can't be blank")
      end
      it "郵便番号が空だとうまくいかない" do
          @payment_form.postal_code = ""
          @payment_form.valid?
          expect(@payment_form.errors.full_messages).to include("Postal code can't be blank")
      end  
      it "郵便番号が数字3桁と数字4桁の間にハイフンがないとうまくいかない" do
        @payment_form.postal_code = 12-34
        @payment_form.valid?
        expect(@payment_form.errors.full_messages).to include("Postal code を正しく記入してください")
    end  
    it "郵便番号が全角だとうまくいかない" do
      @payment_form.postal_code = "１１１"
      @payment_form.valid?
      expect(@payment_form.errors.full_messages).to include("Postal code を正しく記入してください")
    end  
      it "電話番号が空だとうまくいかない" do
        @payment_form.phone_number = ""
        @payment_form.valid?
        expect(@payment_form.errors.full_messages).to include("Phone number can't be blank")
     end
     it "電話番号が全角だとうまくいかない" do
      @payment_form.phone_number = "１１１"
      @payment_form.valid?
      expect(@payment_form.errors.full_messages).to include("Phone number を半角数字で入力してください")
   end
     it "都道府県が空だとうまくいかない" do
      @payment_form.prefecture_id = ""
      @payment_form.valid?
      expect(@payment_form.errors.full_messages).to include("Prefecture is not a number")
     end
     it "都道府県が1以外でないと登録できない" do
      @payment_form.prefecture_id = 1
      @payment_form.valid?
      expect(@payment_form.errors.full_messages).to include("Prefecture must be other than 1")
    end
     it "市区町村が空だとうまくいかない" do
      @payment_form.city = ""
      @payment_form.valid?
      expect(@payment_form.errors.full_messages).to include("City can't be blank")
     end
     it "番地が空だとうまくいかない" do
      @payment_form.house_number = ""
      @payment_form.valid?
      expect(@payment_form.errors.full_messages).to include("House number can't be blank")
      end
    end  
   end
end