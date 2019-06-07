class MenusController < ApplicationController
  def index
  	@menu = current_user.menus
  end

  def show
    @menu = get_menu(params[:id])
    @title = @menu.title
  end

  def edit
  end

  def new
  end
  
  def destroy
    Menu.find(params[:id]).destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def get_menu(id)
    Menu.find(id)
  end
  
end
