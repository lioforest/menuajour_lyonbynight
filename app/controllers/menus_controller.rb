class MenusController < ApplicationController
  def index
  end

  def show
    @menu = get_menu(params[:id])
    @title = @menu.title
  end

  def edit
  end

  def new
  end
  
  private

  def get_menu(id)
    Menu.find(id)
  end
end
