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
         
    it 'passwordが６文字以上であれば登録できる'
         @user.password = "aaaaaa"
         expect(@user).to be_valid
    end
    it 'passwordに英数字両方含まれていれば登録できる'
         @user.password = "aaa000"
         expect(@user).to be_valid
    end
    it 'surnameが全角であれば登録できる'
         @user.surname = "佐藤"
         expect(@user).to be_valid
    end
    it 'nameが全角であれば登録できる'
         @user.name = "弘樹"
         expect(@user).to be_valid
     end
    it 'kana_surnameが全角であれば登録できる'
         @user.kana_surname = "サトウ"
         expect(@user).to be_valid
    end
    it 'kana_nameが全角であれば登録できる'
         @user.kana_name = "ヒロキ"
         expect(@user).to be_valid
    end
    it 'kana_surnameがカナであれば登録できる'
         @user.kana_surname = "サトウ"
         expect(@user).to be_valid
    end
    it 'kana_nameがカナであれば登録できる'
         @user.kana_name = "ヒロキ"
         expect(@user).to be_valid
    end
  end
    
    context '新規登録がうまくいかない時' do
     it "nicknameが空だと登録できない" do
      @user.nickname = ""
       @user.valid?
       expect(user.errors.full_messages).to include ("Nickname can't be blank")
     end
     it "emailが空では登録できない" do 
      @user.email = ""
      @user.valid?
      expect(user.errors.full_messages).to include ("Email can't be blank")
     end
     it '重複するemailがあれば登録できない'
          @user.save.
          another_user = FactoryBot.build(:user)
          another_user.email = @user_email
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが5文字以下であれば登録できない'
         @user.password = "aaaa"
         @user.valid?
         expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'passwordに英数字両方含まれていなければ登録できない'
         @user.password = "aaaaaa"
         @user.valid?
         binding.pry
    end
    it "surnameが空では登録できない" do
      @user.surname = ""
      @user.valid?
      expect(user.errors.full_messages).to include("Surname can't be blank")
    end
    it 'surnameが全角でなければ登録できない'
       @user.kana_surname = "ｱｲｳｴ"
       @user.valid?
    end

    it "nameが空では登録できない" do  
      @user.name = ""
      @user.valid?
      expect(user.errors.full_messages).to include("Name can't be blank")
    end
    it 'nameが全角でなければ登録できない'
       @user.kana_surname = "ｱｲｳｴ"
       @user.valid?
    end

    it "kana_surnameが空では登録できない" do  
      @user.kana_surname = ""
      @user.valid?
      expect(user.errors.full_messages).to include("Kana_surname can't be blank")
    end
    it 'kana_surnameが全角でなければ登録できない'
       @user.kana_surname = "ｱｲｳｴ"
       @user.valid?
    end
    it 'kana_surnameがカナ以外であれば登録できない'
      @user.kana_surname = "あいうえ"
      @user.valid?
    end

    it "kana_nameが空では登録できない" do
      @user.kana_name = ""
      @user.valid?
      expect(user.errors.full_messages).to include("kana_name can't be blank")
    end
    it 'kana_nameが全角でなければ登録できない'
       @user.kana_surname = "ｱｲｳｴ"
       @user.valid?
    end
    it 'kana_nameがカナ以外であれば登録できない'
       @user.kana_surname = "あいうえ"
       @user.valid?
    end

    it "birthdayが空では登録できない" do 
      @user.birthday = ""
      @user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
       end
   end
  end
end