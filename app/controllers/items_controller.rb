class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_item, only: [:show, :update, :edit, :destroy]
  before_action :search_item, only: [:index, :search, :show]

  
  def index
    @item = Item.all.order('created_at DESC')
  end

  def search
    @i= Item.ransack(params[:q])
    @results = @i.result
  end

  def new
    @item = Item.new
  end

  def destroy
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path
    end
  end

  def show
  end

  def update
    @item.update(item_params) if @item.user_id == current_user.id
    if @item.valid?
       redirect_to action: :edit
    else
      render :edit
    end
  end

  def edit
    if @item.user_id != current_user.id || @item.purchase_record.present?
      redirect_to root_path
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

  def set_item
    @item = Item.find(params[:id])
  end

  def search_item
    @i = Item.ransack(params[:q])
    
  end
end
