class MenusController < ApplicationController
	before_action :authenticate_user!

  def index
  if helpers.checked_user
	  	@menus = current_user.menus
	else
    	redirect_to(root_path)
    end
  end

  def show
  if helpers.checked_user
	    @menu = current_user.menus.where(id: params[:id]).first
   	    @title 	= @menu.title
	else
    	redirect_to(root_path)
    end
  end

  def edit
  if helpers.checked_user
	  	@menu = Menu.find(params[:id])
   	    @title 	= @menu.title
	else
    	redirect_to(root_path)
    end

  end

  def update
  if helpers.checked_user
	    @menu = Menu.find(params[:id])
	    menu_params = params.require(:menu).permit(:name,:title,:subtitle)    
   		if @menu.update(menu_params)
      		render :edit
	    else
      redirect_to(root_path)
    	end
  	end
  end

  def new
  end
  
  def destroy
  if helpers.checked_user
  		Menu.find(params[:id]).destroy
    	redirect_back(fallback_location: root_path)
    end
  end

end
