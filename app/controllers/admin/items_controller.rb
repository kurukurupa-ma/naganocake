class Admin::ItemsController < ApplicationController
  def index
    @items = Item.order(:id).page(params[:page])
    @item = Item.new
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    
  end
  
  def show
    @item = Item.find(params[:id])
    @genre = Genre.find(@item.grnre_id)
  end
  
  def edit
    @item = find_item_by_id
  end
  
  def update
    @item = Item.find(params[:id])
    
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active)
  end
  def find_item_by_id
    Item.find(params[:id])
  end
end
