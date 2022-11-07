class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :goods, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      render :thanks
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

  def goods
    @item = Item.find(params[:item_id])
  end


end
