class ItemsController < ApplicationController
  def index
    # @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = 
  end


  private

  def item_params
    params.require(:item).permit(:image, :nickname, :description, :category_id, 
    :condition_id, :shipping_fee_id, :prefecture_id, :delivery_time_id, :price 
    ).merge(user_id: current_user.id )
  end
end
