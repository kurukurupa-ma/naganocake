class Admin::ItemsController < ApplicationController
  def index
    @items = Item.order(:id).page(params[:page])
    @item = Item.new
    @genre = Genre.new
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item)
    end
  end
  
  def show
    @item = Item.find(params[:id])
    @genre = Genre.find(@item.genre_id)
  end
  
  def edit
    @item = find_item_by_id
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path
    end
    
  end
  
  private
  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :is_active, :item_image)
  end
  def find_item_by_id
    Item.find(params[:id])
  end
end
