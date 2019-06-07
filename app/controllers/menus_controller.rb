class MenusController < ApplicationController
  def index
  	@menu = current_user.menus
  end

  def show
  end

  def edit
  end

  def new
  end

  def destroy
  end
end
