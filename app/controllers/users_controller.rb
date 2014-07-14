class UsersController < ApplicationController
  def index
    authorize User
  end

  def show
    @user = User.find(params[:id])
    authorize @user
    @items = @user.items
  end

end
