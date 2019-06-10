class MenusController < ApplicationController
	before_action :authenticate_user!

  def index
  	if check_user
	  	@menus = current_user.menus
	else
    	redirect_to(root_path)
    end
  end

  def show
  	if check_user
	    @menu = current_user.menus.where(id: params[:id]).first
   	    @title 	= @menu.title
	else
    	redirect_to(root_path)
    end
  end

  def edit
  	if check_user
	  	@menu = Menu.find(params[:id])
   	    @title 	= @menu.title
	else
    	redirect_to(root_path)
    end

  end

  def update
  	if check_user
	    @menu = Menu.find(params[:id])
	    menu_params = params.require(:menu).permit(:name,:title,:subtitle)    
   		if @menu.update(menu_params)
      		render :edit
	    else
    	  render :edit
    	end
  	end
  end

  def new
  end
  
  def destroy
  	if check_user
  		Menu.find(params[:id]).destroy
    	redirect_back(fallback_location: root_path)
    end
  end



private
	def get_user_url
		@user_in_url = User.find(params[:user_id])
	end    
	def check_user
		get_user_url
		    if @user_in_url == current_user
		    	return true
		    else
		    	return false
		    end
	end    
end
