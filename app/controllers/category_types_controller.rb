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

  def edit
    @category = get_category
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end
    
  def update
    name = params[:name]
    @category_type = get_category
    puts "=" * 120
    puts params[:add_item_type]
    puts "=" * 120

    if params[:remove_item_type]
      remove_item_type
    elsif params[:item_type_id]
      add_item_type
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
################################################
################## Methods #####################
################################################

#***************** Private *********************#
  private

  def get_category
    CategoryType.find(params[:id])
  end

  def add_item_type
    @category_type.add_item_type_by_id(params[:item_type_id])
    redirect_back(fallback_location: root_path)
  end

  def remove_item_type
    @category_type.remove_item_type_by_id(params[:item_type_id])
    redirect_back(fallback_location: root_path)
  end
end
