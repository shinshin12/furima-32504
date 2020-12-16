require 'rails_helper'
RSpec.describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
    end
 describe 'ユーザー新規登録' do
   context '新規登録がうまくいく時' do
    it 'nicknameとemail,password,surname,name,kana_surname,kana_name,birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
    end
         
    it 'passwordが６文字以上であれば登録できる' do
         expect(@user).to be_valid
    end
    it 'passwordに英数字両方含まれていれば登録できる' do
         @user.password = "aaa000"
         expect(@user).to be_valid
    end
    it 'surnameが全角であれば登録できる' do
         @user.surname = "佐藤"
         expect(@user).to be_valid
    end
    it 'nameが全角であれば登録できる' do
         @user.name = "孝宏"
         expect(@user).to be_valid
     end
    it 'kana_surnameが全角であれば登録できる' do
         @user.kana_surname = "サトウ"
         expect(@user).to be_valid
    end
    it 'kana_nameが全角であれば登録できる' do
         @user.kana_name = "タカヒロ"
         expect(@user).to be_valid
    end
    it 'kana_surnameがカナであれば登録できる' do
         @user.kana_surname = "サトウ"
         expect(@user).to be_valid
    end
    it 'kana_nameがカナであれば登録できる' do
         @user.kana_name = "タカヒロ"
         expect(@user).to be_valid
    end
  end
    
    context '新規登録がうまくいかない時' do
     it "nicknameが空だと登録できない" do
      @user.nickname = ""
       @user.valid?
       expect(@user.errors.full_messages).to include ("Nickname can't be blank")
     end
     it "emailが空では登録できない" do 
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include ("Email can't be blank")
     end

    it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが5文字以下であれば登録できない' do
         @user.password = "aaaaa"
         @user.valid?
         expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'passwordに英数字両方含まれていなければ登録できない' do
         @user.password = "aaaaaa"
         @user.valid?
         expect(@user.errors.full_messages).to include("Passwordには英字と数字の両方を含めて設定してください")
    end
    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "surnameが空では登録できない" do
      @user.surname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname can't be blank")
    end
    it 'surnameが全角でなければ登録できない' do
       @user.kana_surname = "ｱｲｳｴ"
       @user.valid?
      expect(@user.errors.full_messages).to include("Kana surname 全角文字を使用してください")
    end

    it "nameが空では登録できない" do  
      @user.name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end
    it 'nameが全角でなければ登録できない' do
       @user.kana_surname = "ｱｲｳｴ"
       @user.valid?
       expect(@user.errors.full_messages).to include("Name 全角文字を使用してください")
    end

    it "kana_surnameが空では登録できない" do  
      @user.kana_surname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana surname can't be blank")
    end
    it 'kana_surnameが全角でなければ登録できない' do
       @user.kana_surname = "ｱｲｳｴ"
       @user.valid?
       expect(@user.errors.full_messages).to include("Kana surname 全角文字を使用してください")
    end

    it "kana_nameが空では登録できない" do
      @user.kana_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("kana name can't be blank")
    end
    it 'kana_nameが全角でなければ登録できない' do
       @user.kana_surname = "ｱｲｳｴ"
       @user.valid?
       binding.pry
       expect(@user.errors.full_messages).to include("Kana name 全角文字を使用してください")
    end
    
    it "birthdayが空では登録できない" do 
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
       end
   end
  end
end