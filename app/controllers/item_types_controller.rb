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
  ItemType.find(params[:id]).destroy
  redirect_back(fallback_location: root_path)
end

def new
end
end
