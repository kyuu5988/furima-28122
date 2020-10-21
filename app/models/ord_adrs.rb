class OrdAdrs
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :order_id, :post, :pref_id, :city, :area, :bld, :phone

  with_options presence: true do
    validates :post, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "ハイフンを入れて正しく入力して下さい。"}
    validates :city, :area
    validates :phone, format: { with: /\A[0-9]{10,11}\z/, message: "10桁または11桁の正しい番号を入力して下さい。（ハイフン不要）"}
  end

  validates :pref_id, numericality: { other_than: 0, message: "必ず選択して下さい。" }

  


end