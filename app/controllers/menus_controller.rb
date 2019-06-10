class MenusController < ApplicationController
	before_action :authenticate_user!

  def index
  	@menus = current_user.menus
  end

  def show
	user_menus = current_user.menus
    @menu = user_menus.where(id: params[:id]).first
    if @menu.nil?
    	redirect_to(root_path)
	else
	    @title 	= @menu.title
    end
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
