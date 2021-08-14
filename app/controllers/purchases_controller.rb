class PurchasesController < ApplicationController
  before_action :authenticate_user!,  only: [:index, :create ]
  before_action :set_item, only: [:index, :create ]
  before_action :move_root, only: [:index, :create ]
  
  def index
    
    @order = Order.new
  end

  def create
   
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(item_id: params[:item_id], token: params[:token], user_id: current_user.id )
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
        amount: @item.price, 
        card: order_params[:token],   
        currency: 'jpy'                 
    )
  end
  def set_item
    @item = Item.find(params[:item_id])
  end
  def move_root
    return redirect_to root_path if @item.purchase.present? || current_user.id == @item.user.id
  end

end
