class UsersController < ApplicationController
  def index
    authorize User
  end

  def show
    @user = User.find(params[:id])
    authorize @user
    @lists = @user.lists
  end

end
