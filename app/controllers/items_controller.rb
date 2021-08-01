class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :edit]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  # def destroy
  #   @item = Item.find(params[:id])
  # end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    Item.update(item_params)
    redirect_to item_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :category_id, :product_condition_id, :shipping_charge_id, :prefecture_id, :day_to_ship_id,
                                 :product_name, :product_info, :price).merge(user_id: current_user.id)
  end
end
