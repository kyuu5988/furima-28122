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
      it "金額が9,999,999円まで登録OK" do
        @item.price = 9999999
        expect(@item).to be_valid
      end
    end

    context '出品が異常な場合' do
      it "画像添付が無いと登録NG" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image 画像は必ず添付してください")
      end
      it "商品名が無いと登録NG" do
        @item.p_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("P name こちらは必ず入力して下さい。")
      end
      it "商品説明が無いと登録NG" do
        @item.p_info = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("P info こちらは必ず入力して下さい。")
      end
      it "カテゴリーの選択が無いと登録NG" do
        @item.ctg_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Ctg カテゴリーは必ず選んで下さい。")
      end
      it "商品状態の選択が無いと登録NG" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status 商品の状態は必ず選んで下さい。")
      end
      it "送料負担の選択が無いと登録NG" do
        @item.de_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("De fee 配送料の負担は必ず選んで下さい。")
      end
      it "発送元の選択が無いと登録NG" do
        @item.de_are_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("De are 発送元の地域は必ず選んで下さい。")
      end
      it "発送日数の選択が無いと登録NG" do
        @item.de_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("De day 発送までの日数は必ず選んで下さい。")
      end
      it "販売価格が無いと登録NG" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price こちらは必ず入力して下さい。")
      end
      it "販売価格が規定を超えると登録NG" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 指定の範囲で半角数字で入力して下さい。")
      end
      it "販売価格が規定未満だと登録NG" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 指定の範囲で半角数字で入力して下さい。")
      end
    end
  end
end
