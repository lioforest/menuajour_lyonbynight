class MenuItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @menu_categories = current_user.menu_categories
  end

  def show
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def new
  end
end
