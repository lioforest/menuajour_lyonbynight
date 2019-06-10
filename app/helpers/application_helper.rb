module ApplicationHelper

  def is_subscribed_user?


  	if current_user.subscriptions.last != nil
	    if current_user.subscriptions.last.end_date > Date.today
	    	return true
	    end
	end
    
  end

end
