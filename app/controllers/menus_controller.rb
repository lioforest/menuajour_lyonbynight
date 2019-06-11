class MenusController < ApplicationController
	before_action :authenticate_user!

  def index
    @title = "Mes menus"
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
   		if @menu.update(name: params[:name], title: params[:title], subtitle: params[:subtitle])
          flash[:success] = 'Votre changement a été enregistré'

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
          flash[:success] = 'Votre menu a été supprimé'
    	redirect_back(fallback_location: root_path)
    end
  end

end
