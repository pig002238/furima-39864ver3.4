class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  def edit
  end

  def update
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :item, :item_description, :category_id, :item_condition_id, :postage_id, :prefecture_id, :delivery_time_id, :price).merge(user_id: current_user.id)
  end
  
end
