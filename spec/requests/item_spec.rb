require 'rails_helper'
RSpec.describe Item, type: :model do
   let(:item) {FactoryBot.create(:item)}
  before do
    @item = FactoryBot.build(:item)
  end
   
  describe "商品出品機能" do
    context "商品登録がうまくいく時" do
    it "item_name,explanation,category_id,shipping_method_id,prefecture_id,day_time_id price,imageが存在すれば登録できる" do
      expect(@item).to be_valid
     end
    end
    
    context "商品登録がうまくいかない時" do
    it "イメージが空だとうまくいかない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "商品名が空だとうまくいかない" do
      @item.item_name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end
    it "商品の説明が空だとうまくいかない" do
      @item.explanation = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end
    it "販売価格が空だとうまくいかない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")    
    end
    it "販売価格を全角で入力するとうまくいかない" do
      @item.price = "５５５５５"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")  
    end
    it "販売価格が9,999,999を超えるとうまくいかない" do
       @item.price = 10000000
       @item.valid?
       expect(@item.errors.full_messages).to include("Price は対象の値段外です")
    end
    it "販売価格が299円以下では登録できない" do
       @item.price = 299
       @item.valid?
       expect(@item.errors.full_messages).to include("Price は対象の値段外です")
    end
    it "半角英数混合では登録できないこと" do
      @item.price = "2332aaa"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number") 
    end
    it "半角英語だけでは登録できないこと"do
    @item.price = "aaaaaa"
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is not a number") 
    end
    it "カテゴリーが空だとうまくいかない" do
      @item.category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Category is not a number")
    end
    it "カテゴリーが1意外でないと登録できない事" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it "商品の状態が空だとうまくいかない" do
      @item.shipping_method_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping method is not a number")
    end
    it "商品の状態が1以外でないと登録できない事" do
      @item.shipping_method_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping method must be other than 1")
    end
    it "配送料の負担が空だとうまくいかない" do
      @item.state_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("State is not a number")
    end
    it "配送料の負担が1以外でないと登録できない事" do
      @item.state_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("State must be other than 1")
    end
    it "地域が空だとうまくいかない" do
      @item.prefecture_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture is not a number")
    end
    it "地域が1以外でないと登録できない事" do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it "配送までの日数が空だとうまくいかない" do
      @item.day_time_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Day time is not a number")
    end
    it "配送までの日数が1以外でないと登録できない事" do
      @item.day_time_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Day Time must be other than 1")
    end
   end
  end
end

