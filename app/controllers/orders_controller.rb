class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :move_top_if_sold_out
  before_action :move_to_root_if_seller


  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_address = OrderAddress.new 
  end

 
  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_address_params
    params.require(:order_address).permit(:postal_code, 
    :prefecture_id, :city, :address, :building, :phone_number
    ).merge(
      user_id: current_user.id,
      item_id: @item.id,
      token: params[:token] )
  end

  def set_item
    @item = Item.find(params[:item_id]) 
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_address_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end

  def move_to_root_if_seller
    redirect_to root_path if current_user.id == @item.user_id
  end
  
  def move_top_if_sold_out
    redirect_to root_path if @item.order.present?
  end

end
