class CartsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    cart = current_user.prepare_cart
    @item = cart.items
  end

  private

  


end
