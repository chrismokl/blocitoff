# /api/users/3/lists
# {lists: [{name: 'whatever'}]}

class Api::V1::ItemsController < ActionController::Base
  def index
    @list = List.find(params[:list_id])
    render json: @list.items
  end

  def create
    @list = List.find(params[:list_id])
    render json: @list.items.create(params.require(:item).permit(:title))
  end
end
