# /api/users/3/lists
# {lists: [{name: 'whatever'}]}

class Api::V1::ListsController < ActionController::Base
  def index
    @user = User.find(params[:user_id])
    render json: @user.lists
  end

  def create
    @user = User.find(params[:user_id])
    render json: @user.lists.create(params.require(:list).permit(:title))
  end
end
