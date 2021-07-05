class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end  

  def create
    @room = Item.new(item_params)
    if @item.valid?
      @item.save
      return redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image,:category_id, :product_condition_id,:shipping_charge_id,:prefecture_id,:day_to_ship_id,:product＿name,:product＿info,:price ).merge(user_id: current_user.id)
  end
end