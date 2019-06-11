class CategoryTypesController < ApplicationController
  def index
  end

  def show
  end

  def create
    category_name = params[:name]
    current_user.create_new_category_type(category_name)
    redirect_back(fallback_location: root_path)
  end

  def edit
  end

  def update
    category_type_id = params[:id]
    add_item_type = params[:add_item_type]
    item_type_id = params[:item_type_id]

    @category_type = CategoryType.find(category_type_id)
    if add_item_type
      @category_type.add_item_type_by_id(item_type_id)
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    CategoryType.find(params[:id]).destroy
    redirect_back(fallback_location: root_path)
  end

  def new
  end
end
