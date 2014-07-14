class Users::ItemsController < ApplicationController
  def index
    # @items = Item.all
    @items = Item.where("created_at > ?", Time.now - 7.days)
  end

end