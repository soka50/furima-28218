class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :move_root, only: [:edit, :update]
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
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    if @item.update(item_params)

      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def move_root
    redirect_to root_path if current_user.id != @item.user.id
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :category_id, :product_condition_id, :shipping_charge_id, :prefecture_id, :day_to_ship_id,
                                 :product_name, :product_info, :price).merge(user_id: current_user.id)
  end
end
