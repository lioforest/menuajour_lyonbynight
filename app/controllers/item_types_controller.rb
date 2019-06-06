class ItemTypesController < ApplicationController
   before_action :authenticate_user!

  def index
    @category_types = current_user.category_types
  end

  def show
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def new
  end
end
