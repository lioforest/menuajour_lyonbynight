class CategoryTypesController < ApplicationController
  def create
    category_name = params[:name]
    current_user.create_new_category_type(category_name)

    respond_to do |format|
      format.html do
        redirect_back(fallback_location: root_path)
      end
      format.js {}
    end
  end

  def update
    add_item_type = params[:add_item_type]
    item_type_id = params[:item_type_id]
    name = params[:name]

    @category_type = get_category
    if add_item_type
      @category_type.add_item_type_by_id(item_type_id)
      redirect_back(fallback_location: root_path)
    elsif name
      @category_type.update(name: name)
      respond_to do | format |
        format.html { redirect_back(fallback_location: root_path) }
        format.js {}
      end
    end
  end

  def destroy
    get_category.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def get_category
    CategoryType.find(params[:id])
  end
end
