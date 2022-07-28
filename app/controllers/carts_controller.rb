class CartsController < ApplicationController

  def index
    @items = Item.all
    cart_items = CartItem.where(cart_id: current_cart.id).pluck(:item_id)
    @cart_list = Item.find(cart_items)
  end

  def create
    carts = Cart.new(item_id: params[:item_id])
    if carts.save
      redirect_back(fallback_location: root_path)
    else
       redirect_back(fallback_location: root_path)
    end
  end
  
  def destroy
    user = current_user
    item = Item.find(params[:item_id])
    if cart = Cart.find_by(user_id: current_user.id, item_id: item.id)
     cart.destroy
     redirect_back(fallback_location: root_path)
    else
     redirect_back(fallback_location: root_path)
    end
  end

  private


end
