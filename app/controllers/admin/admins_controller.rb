class Admin::AdminsController < ApplicationController


def index
			@admin = current_user

end


end