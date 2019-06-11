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
end

def update
end

def destroy
  ItemType.find(params[:id]).destroy
  redirect_back(fallback_location: root_path)
end

def new
end
end
