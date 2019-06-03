class UsersController < ApplicationController
before_cation :authenticate_user!, only: [:show]

  def show
  	@user = User.find(params[:id])
  end
  
end
