class ItemsController < ApplicationController
  def index

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(id: current_user)
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:content, :image, :category_id, :delivery_charge_id, :pref_id,:shipping_date_id, :quality_id, :message, :fee, :nickname).merge(user_id: current_user.id)
  end
end
