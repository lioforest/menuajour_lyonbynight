class ItemTypesController < ApplicationController
 before_action :authenticate_user!

  def index
    @category_types = current_user.category_types
    @title = "Mes plats"
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
    respond_to do | format |
      format.html {}
      format.js {}
    end
  end

  def update
    if get_item.update(name: params[:name])
      flash[:success] = 'Votre changement a été enregistré'

      render :edit
    end
  end

  def destroy
    get_item.destroy
    redirect_back(fallback_location: root_path)
  end

  def new
  end

  private

  def get_item
    ItemType.find(params[:id])
  end
end
