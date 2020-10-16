class ItemsController < ApplicationController

  before_action :move_to_index, except: [:index]

  def index    
  end

  def new
    @item = Item.new    
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      flash[:blank] = "[ エラー ] 入力・選択していない箇所があります。画像は再度選択をお願い致します。"    
      render :new
    end
  end


  private

  def item_params
    params.require(:item).permit(:p_name,:p_info,:ctg_id,:status_id,:de_fee_id,:de_are_id,:de_day_id,:price,:image).merge(user_id: current_user[:id],sold: false)
  end

  def move_to_index
    unless user_signed_in?
      flash[:notice] = "[ エラー ] 出品するにはログインが必要です。"    
      redirect_to action: :index
    end
  end

end
