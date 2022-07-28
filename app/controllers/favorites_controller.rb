class FavoritesController < ApplicationController

  def index
    @items = Item.all

    favorites = Favorite.where(user_id: current_user.id).pluck(:item_id)
    @favorite_list = Item.find(favorites)
  end

  def create
    
    favorites = current_user.favorites.build(item_id: params[:item_id])
    if favorites.save
     redirect_back(fallback_location: root_path)
    else
      @item = favorites.item
      favorites = @item.favorites
      redirect_back(fallback_location: root_path)
    end
  end
  
  def destroy
    user = current_user
    item = Item.find(params[:item_id])
    if favorite = Favorite.find_by(user_id: current_user.id, item_id: item.id)
     favorite.destroy
     redirect_back(fallback_location: root_path)
    else
     redirect_back(fallback_location: root_path)
    end
  end
end
