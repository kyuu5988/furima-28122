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
    binding.pry
    @ord_adrs = OrdAdrs.new(order_params)
    # binding.pry
     if @ord_adrs.valid?
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
   params.permit(:item_id, :post, :pref_id, :city, :area, :bld, :phone).merge(user_id: current_user[:id])#,:item_id, :order_id)
  end

end

# require(:ord_adrs).