require 'rails_helper'
describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test.jpg')
  end

  describe '出品する時の確認' do
    context '出品が正常に出来る場合' do
      it "全カラムに対して指定の値であれば登録OK" do
        expect(@item).to be_valid
      end
      # it "nicknameが日本語で登録OK" do
      #   @user.nickname = "にっくねーむ" 
      #   expect(@user).to be_valid
      # end
      # it "passwordが6文字以上の英数で登録OK" do
      #    @user.password = "1234ab"
      #    @user.password_confirmation = "1234ab"
      #    expect(@user).to be_valid
      # end
    end

    # context '出品が異常な場合' do
    #   it "nicknameが無いと登録NG" do
    #     @user.nickname = ''
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Nickname こちらは必ず入力して下さい。")
    #   end       
    #   it "emailが無いと登録NG" do
    #     @user.email = ""
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Email こちらは必ず入力して下さい。")
    #   end    
    #   it "同じemailは登録NG" do
    #     @user.save
    #     another_user = FactoryBot.build(:user)
    #     another_user.email = @user.email
    #     another_user.valid?
    #     expect(another_user.errors.full_messages).to include("Email 以下のアドレスは使用済みです。")
    #   end
    #   it "emailに@が無いと登録NG" do
    #     @user.email = "sample.com"
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Email は有効でありません。")
    #   end
    #   it "passwordが無いと登録NG" do
    #     @user.password = ""
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Password こちらは必ず入力して下さい。")
    #   end
    #   it "passwordが5文字以下は登録NG" do
    #     @user.password = "123ab"
    #     @user.password_confirmation = "123ab"
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Password 6文字以上に設定して下さい。")
    #   end
    #   it "passwordが英字のみだと登録NG" do
    #     @user.password = "samplesample"
    #     @user.password_confirmation = "samplesample"
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Password 英字と数字を含めて入力して下さい")
    #   end
    #   it "passwordが数字のみだと登録NG" do
    #     @user.password = "123456"
    #     @user.password_confirmation = "123456"
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Password 英字と数字を含めて入力して下さい")
    #   end
    #   it "password_confirmationが無いと登録NG" do
    #     @user.password_confirmation = ""
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Password confirmation 再入力のパスワードと一致していません。")
    #   end
    #   it "last_nameが無いと登録NG" do
    #     @user.last_name = ''
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Last name こちらは必ず入力して下さい。")            
    #   end
    #   it "first_nameが無いと登録NG" do
    #     @user.first_name = ''
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("First name こちらは必ず入力して下さい。")            
    #   end
    #   it "last_nameが英半角だと登録NG" do
    #     @user.last_name = 'yamada'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Last name 全角日本語を使用してください")            
    #   end
    #   it "first_nameが英半角だと登録NG" do
    #     @user.first_name = 'taro'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("First name 全角日本語を使用してください")            
    #   end
    #   it "last_kanaが無いと登録NG" do
    #     @user.last_kana = ''
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Last kana こちらは必ず入力して下さい。")            
    #   end
    #   it "first_kana無いと登録NG" do
    #     @user.first_kana = ''
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("First kana こちらは必ず入力して下さい。")            
    #   end
    #   it "last_kanaが漢字だと登録NG" do
    #     @user.last_kana = '山田'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Last kana 全角カタカナを使用してください")            
    #   end
    #   it "first_kanaが漢字だと登録NG" do
    #     @user.first_kana = '太郎'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("First kana 全角カタカナを使用してください")            
    #   end
    #   it "生年月日が無いと登録NG" do
    #     @user.b_day = ''
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("B day こちらは必ず入力して下さい。")            
    #   end
    # end
  end
end
