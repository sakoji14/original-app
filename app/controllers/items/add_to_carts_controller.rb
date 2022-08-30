class Items::AddToCartsController < Items::ApplicationController

  def create
    cart = current_user.prepare_cart
    item = Item.find(params[:item_id])
    cart.cart_items.create!(item_id: item.id)
    redirect_to carts_path
  end
end