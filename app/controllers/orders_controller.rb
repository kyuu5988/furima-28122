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
end
