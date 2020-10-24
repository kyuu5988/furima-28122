require 'rails_helper'
describe OrdAdrs, type: :model do
  before do
    @ord_adrs = FactoryBot.build(:ord_adrs)
  end

  describe '購入する時の確認' do
    context '購入が正常に出来る場合' do
      it "フォームに正しい値があればOK" do
        expect(@ord_adrs).to be_valid
      end
      it "電話番号が10桁でもOK" do
        @ord_adrs.phone = "0312345678"
        expect(@ord_adrs).to be_valid
      end
    end

    context '購入が異常な場合' do
      it "tokenが無いとNG" do
        @ord_adrs.token = nil
        @ord_adrs.valid?
        expect(@ord_adrs.errors.full_messages).to include("Token こちらは必ず入力して下さい。")
      end
      it "priceが無いとNG" do
        @ord_adrs.price = nil
        @ord_adrs.valid?
        expect(@ord_adrs.errors.full_messages).to include("Price こちらは必ず入力して下さい。")
      end
      it "郵便番号が無いとNG" do
        @ord_adrs.post = ""
        @ord_adrs.valid?
        expect(@ord_adrs.errors.full_messages).to include("Post こちらは必ず入力して下さい。")
      end
      it "郵便番号が指定外の形式だとNG" do
        @ord_adrs.post = "2224444"
        @ord_adrs.valid?
        expect(@ord_adrs.errors.full_messages).to include("Post ハイフンを入れて正しく入力して下さい。")
      end
      it "都道府県の選択が無いとNG" do
        @ord_adrs.pref_id = nil
        @ord_adrs.valid?
        expect(@ord_adrs.errors.full_messages).to include("Pref こちらは必ず入力して下さい。")
      end
      it "市区町村が未記入だとNG" do
        @ord_adrs.city = ""
        @ord_adrs.valid?
        expect(@ord_adrs.errors.full_messages).to include("City こちらは必ず入力して下さい。")
      end
      it "番地が未記入だとNG" do
        @ord_adrs.area = ""
        @ord_adrs.valid?
        expect(@ord_adrs.errors.full_messages).to include("Area こちらは必ず入力して下さい。")
      end
      it "電話番号が未記入だとNG" do
        @ord_adrs.phone = ""
        @ord_adrs.valid?
        expect(@ord_adrs.errors.full_messages).to include("Phone こちらは必ず入力して下さい。")
      end
      it "電話番号が指定の形式以外だとNG" do
        @ord_adrs.phone = "03-1234-5678"
        @ord_adrs.valid?
        expect(@ord_adrs.errors.full_messages).to include("Phone 10桁または11桁の正しい番号を入力して下さい。（ハイフン不要）")
      end

    end
  end
end
