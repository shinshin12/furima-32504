require 'rails_helper'
RSpec.describe PaymentForm, type: :model do
  let(:@payment_form) {FactoryBot.create(:payment_form)}
  before do
    @payment_form = FactoryBot.build(:payment_form)
  end
  describe '購入機能' do
    context '購入機能がうまくいく時' do
     it 'tokenと,postal_code,phone_number,prefecture_id,city,house_numberが存在すれば登録できる' do
         expect(@payment_form).to be_valid
     end
     it "建物名が空でも購入できること" do
         @payment_form.building_name = ""
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
      it "郵便番号にハイフンが無い場合は購入できない" do
        @payment_form.postal_code = 1234
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
      expect(@payment_form.errors.full_messages).to include("Phone number を正しく記入してください")
   end
     it "電話番号にハイフンが入っている場合は購入できない" do
      @payment_form.phone_number = "090-1231-1234"
      @payment_form.valid?
      expect(@payment_form.errors.full_messages).to include("Phone number を正しく記入してください")
     end
     it "電話番号が11桁以上記述されている場合は購入できない" do
      @payment_form.phone_number = "09012311234"
      @payment_form.valid?
      expect(@payment_form.errors.full_messages).to include("Phone number を正しく記入してください")
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