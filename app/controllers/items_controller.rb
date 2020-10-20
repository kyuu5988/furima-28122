class ItemsController < ApplicationController

  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :destroy]


  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new    
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:create] = "出品が完了しました！"    
      redirect_to root_path
    else
      flash[:blank] = "[ エラー ] 入力・選択していない箇所があります。画像は再度選択をお願い致します。"    
      render :new
    end
  end

  def show
  end

  def edit
  end

  def destroy
    @item.destroy
    flash[:destroy] = "出品した商品を削除しました。"    
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:p_name,:p_info,:ctg_id,:status_id,:de_fee_id,:de_are_id,:de_day_id,:price,:image).merge(user_id: current_user[:id],sold: false)
  end

  def move_to_index
    unless user_signed_in?
      flash[:notuser] = "出品するにはログインが必要です。"    
      redirect_to action: :index
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
