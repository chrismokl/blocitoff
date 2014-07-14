class ItemsController < ApplicationController
  def index
    # @items = Item.all
    authorize Item
    @items = Item.where("created_at > ?", Time.now - 7.days)
  end

  # params = {item: {title: 'whatever'}}
  def create
    @new_item = Item.new(params.require(:item).permit(:title))
    @new_item.user = current_user
    authorize @new_item
    @new_item.save
    # redirect_to "/users/#{current_user.id}"
    # redirect_to user_path(current_user.id)
    # redirect_to user_path(current_user)
    redirect_to current_user
  end

  # DELETE /items/123
  def destroy
    @destroy_item = Item.find(params[:id])
    @destroy_item.destroy
    redirect_to current_user
  end

end
