class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @user = current_user
    @title = @user.email
  end

  def update
    action_type = params[:action_type]
    user = User.find(params[:id])

    case action_type
    when "delete_exemple_items"
     user.delete_example_item_types
     redirect_back(fallback_location: root_path)
   end
 end
end
