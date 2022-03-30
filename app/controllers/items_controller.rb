class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :edit]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
    if @item.user == current_user
      render "edit"
    else
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
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
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
end
