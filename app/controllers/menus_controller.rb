class MenusController < ApplicationController
  def index
  	@menu = current_user.menus
  end

  def show
  end

  def edit
  end

  def new
  end

  def destroy
    Menu.find(params[:id]).destroy
    redirect_back(fallback_location: root_path)
  end
end
