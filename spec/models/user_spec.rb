require 'rails_helper'
describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録する時の確認' do
    context '新規登録が正常に出来る場合' do
      it "全てあれば登録OK" do
        expect(@user).to be_valid
      end
      it "nicknameが日本語で登録OK" do
        @user.nickname = "たろ" 
        expect(@user).to be_valid
      end
      it "passwordが6文字以上の英数で登録OK" do
         @user.password = "1234ab"
         @user.password_confirmation = "1234ab"
         expect(@user).to be_valid
      end
    end

    context '新規登録が異常な場合' do
      it "nicknameが無いと登録NG" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname こちらは必ず入力して下さい。")
      end       
      it "emailが無いと登録NG" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("入力して下さい")
      end    
      it "同じemailは登録NG" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("アドレスは使用済み")
      end
      it "passwordが無いと登録NG" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("入力して下さい")
      end
      it "passwordが5文字以下は登録NG" do
        @user.password = "12345"
        @user.password_confirmation = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("6文字以上")
      end
      it "password_confirmationが無いと登録NG" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("一致していません")
      end
    end
  end
end
