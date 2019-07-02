class MenusController < ApplicationController
	before_action :authenticate_user!

  def index
    @title = "Mes menus"
    @subtitle = ["Créez autant de menus que vous le souhaitez !"]
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

   respond_to do |format|
     format.html
     format.pdf do
      if is_subscribed_user?
       render pdf: "mon_menu",
       template: "menus/show.html.erb",
       layout: 'pdf.html.erb',
       dpi: '300',
       encoding: 'utf8',
       page_size: 'A4',
       show_as_html: params[:debug].present?,
       disable_external_links: false
     else
    flash[:success] = 'Vous devez être abonné pour acceder à cette fonctionnalité'
    redirect_to new_user_subscription_path(current_user.id)
    end
  end
end
end

def edit
  if helpers.checked_user
    @menu = Menu.find(params[:id])
    @title 	= @menu.title
    @subtitle = "Ici vous pouvez modifier votre menu : ajoutez les catégories et les plats que vous avez créés dans votre rubrique \"Mes plats\" !"
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
    when "delete_item"
      delete_item
    when "move_item_up"
      move_item_up
    when "move_item_down"
      move_item_down
    when "add_item_to_category"
      add_item_to_category
    end
  end
end

def new
  @menus = Menu.where(user_id: current_user.id)
  @categories = CategoryType.where(user_id: current_user.id)
  @title = "Créer une nouvelle carte"

  @user = User.find(params[:user_id])
  
  respond_to do |format|
    format.html do
      @new = Menu.new	
    end
    format.json do
      render json: @user
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

def delete_item
  @menu.delete_item_by_id(params[:item_id])
  redirect_back(fallback_location: root_path)
end

def move_item_up
  @menu.item_by_id(params[:item_id]).move_up
  redirect_back(fallback_location: root_path)
end

def move_item_down
  @menu.item_by_id(params[:item_id]).move_down
  redirect_back(fallback_location: root_path)
end

def add_item_to_category
  @menu.category_by_id(params[:category_id]).add_item_by_id(params[:item_type_id])
  redirect_back(fallback_location: root_path)
end

end
