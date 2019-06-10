class MenusController < ApplicationController
  def index
  	@menu = current_user.menus
  end

  def show
    @menu = get_menu(params[:id])
    @title = @menu.title
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
  
  def destroy
    Menu.find(params[:id]).destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def get_menu(id)
    Menu.find(id)
  end
  
end
