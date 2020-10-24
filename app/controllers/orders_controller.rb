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
    @ord_adrs = OrdAdrs.new(order_params)
     if @ord_adrs.valid?
      # 決済処理
      pay_item
        
      # 販売済み処理
      sold_out

      @ord_adrs.save
      flash[:buy] = "購入が完了しました！お買い上げありがとうございます！"
      redirect_to item_path(@ord_adrs.item_id)
     else
      flash[:cantbuy] = "入力内容に不備があります。もう一度初めから入力して下さい。"
      redirect_to item_orders_path 

    end
  end
 
  private
  def order_params
   item = Item.find(params[:item_id])
   params.permit(:authenticity_token, :item_id, :post, :pref_id, :city, :area, :bld, :phone, :token).merge(user_id: current_user[:id], price: item[:price])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: order_params[:price],
        card: order_params[:token], 
        currency: 'jpy'           
      )
  end

  def sold_out
    sold = Item.find(params[:item_id])
    sold.update(sold: true)
  end

end

