class MenusController < ApplicationController
  def index
  end

  def show
  end

  def edit
  	@menu = Menu.find(params[:id])
  end

  def update
    @menu = Menu.find(params[:id])
    menu_params = params.require(:menu).permit(:name,:title,:subtitle)    
    if @menu.update(menu_params)
      render :edit

    else
      render :edit
    end
  end

  def new
  end
end
