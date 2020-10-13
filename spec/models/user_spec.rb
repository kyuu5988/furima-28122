require 'rails_helper'
describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録する時の確認' do
    context '新規登録が正常に出来る場合' do
      it "全カラムに対して指定の入力であれば登録OK" do
        expect(@user).to be_valid
      end
      it "nicknameが日本語で登録OK" do
        @user.nickname = "にっくねーむ" 
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
        expect(@user.errors.full_messages).to include("Email こちらは必ず入力して下さい。")
      end    
      it "同じemailは登録NG" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email 以下のアドレスは使用済みです。")
      end
      it "passwordが無いと登録NG" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password こちらは必ず入力して下さい。")
      end
      it "passwordが5文字以下は登録NG" do
        @user.password = "12345"
        @user.password_confirmation = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 6文字以上に設定して下さい。")
      end
      it "password_confirmationが無いと登録NG" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation 再入力のパスワードと一致していません。")
      end
      it "名前漢字が無いと登録NG" do
        @user.last_name = ''
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name こちらは必ず入力して下さい。")            
      end
      it "名前漢字が英半角だと登録NG" do
        @user.last_name = 'yamada'
        @user.first_name = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角日本語を使用してください")            
      end
      it "名前カナが無いと登録NG" do
        @user.last_kana = ''
        @user.first_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana こちらは必ず入力して下さい。")            
      end
      it "名前カナが漢字だと登録NG" do
        @user.last_kana = '山田'
        @user.first_kana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana 全角カタカナを使用してください")            
      end
      it "生年月日が無いと登録NG" do
        @user.b_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("B day こちらは必ず入力して下さい。")            
      end
    end
  end
end
