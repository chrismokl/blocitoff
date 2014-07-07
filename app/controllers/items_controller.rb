class ItemsController < ApplicationController
  def index
    # @items = Item.all
    @items = Item.where("created_at > ?", Time.now - 7.days)
  end


  # params = {item: {title: 'whatever'}}
  def create
    @new_item = Item.new(params.require(:item).permit(:title))
    @new_item.save
    redirect_to items_path
  end

  # DELETE /items/123
  def destroy
    @destroy_item = Item.find(params[:id])
    @destroy_item.destroy
    redirect_to items_path
  end

end
