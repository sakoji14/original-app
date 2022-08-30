class Items::DeleteInCartsController < Items::ApplicationController

  def create
    cart = current_user.prepare_cart
    item = Item.find(params[:item_id])
    
    cart_item = cart.cart_items.find_by(item_id: item.id)
    cart_item.destroy
    redirect_to carts_path
  end
end