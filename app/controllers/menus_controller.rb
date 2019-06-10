class MenusController < ApplicationController
	before_action :authenticate_user!

  def index
	@user_in_url = User.find(params[:user_id])
    if @user_in_url == current_user
	  	@menus = current_user.menus
	else
    	redirect_to(root_path)
    end
  end

  def show
	@user_in_url = User.find(params[:user_id])

    if @user_in_url == current_user
	    @menu = current_user.menus.where(id: params[:id]).first
   	    @title 	= @menu.title
	else
    	redirect_to(root_path)
    end
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


  
end
