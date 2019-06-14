class ItemTypesController < ApplicationController
 before_action :authenticate_user!

  def index
    @category_types = current_user.category_types
    @title = "Mes plats"
    @subtitle = "Ici vous pouvez créer et gérer vos plats, associés à des catégories (ex : entrées, boissons...).\n Une fois cela fait, vous n'aurez plus qu'à les utiliser pour générer autant de menus que vous souhaitez via la rubrique \"Mes Menus\" !"
  end

  def show
  end

  def create
    item_name = params[:name]
    item_description = params[:description]
    item_price = params[:price]
    item_category_type = CategoryType.find(params[:category_type_id])
    item_category_type.create_new_item_type(item_name, item_description, item_price)
    redirect_back(fallback_location: root_path)
  end

  def edit
    @id = params[:id]
    @item = get_item

    respond_to do | format |
      format.html {}
      format.js {}
    end
  end

  def update
    if get_item.update(
        name: params[:name],
        description: params[:description],
        price: params[:price])
      flash[:success] = 'Votre changement a été enregistré'

      redirect_to user_item_types_path(current_user.id, params[:id])
    end
  end

  def destroy
    if params[:item_type_id]
      ItemType.find(params[:item_type_id]).destroy
    end
    redirect_back(fallback_location: root_path)
  end

  def new
  end

  private

  def get_item
    ItemType.find(params[:id])
  end
end
