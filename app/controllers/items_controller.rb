class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:edit]
def index
    @item = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
       redirect_to action: :show
    else
      render :edit
    end
  end

  def edit
    @item = Item.find(params[:id])
    if @item.user_id != current_user.id
       redirect_to root_path
    else
      render :new
    end
  end 
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :status_id, :shipping_cost_id, :shipping_day_id, :prefecture_id,
                                 :category_id, :image).merge(user_id: current_user.id)
  end
end