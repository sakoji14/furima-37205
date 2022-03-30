class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def edit
    if @item.user != current_user
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

  def show
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:content, :image, :category_id, :delivery_charge_id, :pref_id, :shipping_date_id, :quality_id,
                                 :message, :fee, :nickname).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
