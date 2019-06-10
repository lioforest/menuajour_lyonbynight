module ApplicationHelper
	def checkuser
		@user_in_url = User.find(params[:user_id])
	    if @user_in_url == current_user
	    	return true
	    else
	    	return false
	    end
	end    



end
