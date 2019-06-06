class UsersController < ApplicationController
before_action :authenticate_user!, only: [:show]

  def show
    @user = current_user
    @title = @user.email
  end

end
