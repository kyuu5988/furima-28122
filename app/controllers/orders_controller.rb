class OrdersController < ApplicationController
  def index
    unless user_signed_in?
      flash[:login] = "購入するにはログインが必要です。"    
      redirect_to new_user_session_path      
    else
      @item = Item.find(params[:item_id])
      if current_user.id == @item.user_id
        flash[:cantbuy] = "自分の出品は購入出来ません。"    
        redirect_to root_path
      elsif @item.sold
        flash[:cantbuy] = "すでに売り切れです。"    
        redirect_to root_path
      end
    end

  end

  def new
    @ord_adrs = OrdAdrs.new
  end
 
  def create
    # binding.pry
    @ord_adrs = OrdAdrs.new(order_params)
    binding.pry
     if @ord_adrs.valid?

        # 決済処理
        pay_item
        # /決済処理

       @ord_adrs.save
       redirect_to action: :index
     else
      flash[:cantbuy] = "購入エラー（現在まだ記述してるとこ）" 
      redirect_to item_orders_path 
      # redirect_to root_path
   end
  end
 
  private
  def order_params

   item = Item.find(params[:item_id])
    
   params.permit(:authenticity_token, :item_id, :post, :pref_id, :city, :area, :bld, :phone, :token).merge(user_id: current_user[:id], price: item[:price])#,:item_id, :order_id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 自身のPAY.JPテスト秘密鍵
      Payjp::Charge.create(
        amount: order_params[:price],  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'             # 通貨の種類（日本円）
      )
  end

end

# require(:ord_adrs).