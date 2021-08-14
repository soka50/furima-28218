class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def create
    @item = Item.find(params[:item_id])
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
end
