class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @purchase_address = PurchaseAddress.new
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id
      redirect_to root_path
    elsif @item.purchase.present?
      redirect_to root_path
    end
  
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    @item = Item.find(params[:item_id])
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end


  private
  def purchase_params
    params.require(:purchase_address).permit(:post_number, :pref_id, :city, :mail, :build, :tell).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item 
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.fee,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end




end

