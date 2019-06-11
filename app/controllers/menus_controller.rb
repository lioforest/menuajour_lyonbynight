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
   action_type = params[:action_type]

   case action_type
   when "update_menu_info"
    update_menu_info
  when "add_category"
    add_category
  when "move_category_up"
    move_category_up
  when "move_category_down"
    move_category_down
  when "delete_category"
    delete_category
  else
  end
end
end

def create
  _name = params[:name]
  _title = params[:title]
  _subtitle = params[:subtitle]

  current_user.create_new_menu(_name, _title, _subtitle)
  redirect_back(fallback_location: root_path)
end

def destroy
  if helpers.checked_user
    Menu.find(params[:id]).destroy
    flash[:success] = 'Votre menu a été supprimé'
    redirect_back(fallback_location: root_path)
  end
end

################################################
################## Methods #####################
################################################

#***************** Private *********************#
private

def update_menu_info
  if @menu.update(name: params[:name], title: params[:title], subtitle: params[:subtitle])
    flash[:success] = 'Votre changement a été enregistré'
    redirect_back(fallback_location: root_path)
  else
    redirect_to(root_path)
  end
end

def add_category
  @menu.add_category_by_id(params[:category_type_id])
  redirect_back(fallback_location: root_path)
end

def move_category_up
  @menu.category_by_id(params[:category_id]).move_up
  redirect_back(fallback_location: root_path)
end

def move_category_down
  @menu.category_by_id(params[:category_id]).move_down
  redirect_back(fallback_location: root_path)
end

def delete_category
  @menu.delete_category_by_id(params[:category_id])
  redirect_back(fallback_location: root_path)
end

end
