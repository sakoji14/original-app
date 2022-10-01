class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update]
  before_action :move_to_index, except: [:search, :type, :index, :show]

  def index
    @items = Item.all
   
    @all_ranks = Item.find(Favorite.group(:item_id).order('count(item_id) desc').limit(6).pluck(:item_id))
    @q = Item.ransack(params[:q])
    @item = @q.result
  end

  def new
    @item = Item.new
  end

  def edit
    if @item.owner != current_owner
      redirect_to root_path
    #elsif @item.purchase.present?
      #redirect_to root_path
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.owner == current_owner
      redirect_to root_path
    end
    @item.destroy
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
    @owner = Owner.all
    
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def search
    if params[:q]&.dig(:item_name)
      squished_keywords = params[:q][:item_name].squish
      params[:q][:item_name_cont_any] = squished_keywords.split(" ")
    end
    @q = Item.ransack(params[:q])
    @items = @q.result
    
  end
  
  private

  def item_params
    params.require(:item).permit(:item_name, :contents, :category_id, :delivery_method_id, :shipping_date_id, :comment, :fee, {images: []}).merge(owner_id: current_owner.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
