class CategoryTypesController < ApplicationController
  def index
  end

  def show
  end

  def create
    category_name = params[:name]
    current_user.add_category_type(category_name)
    redirect_back(fallback_location: root_path)
  end

  def edit
  end

  def update
  end

  def destroy
    CategoryType.find(params[:id]).destroy
    redirect_back(fallback_location: root_path)
  end

  def new
  end
end
