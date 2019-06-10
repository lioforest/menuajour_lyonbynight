module ApplicationHelper

  def is_subscribed_user?

  	if current_user.subscriptions.last != nil
	    if current_user.subscriptions.last.end_date > Date.today
	    	return true
	    end
	end
    
  end


	def bootstrap_class_for_flash(type)
	  case type
	    when 'notice' then "alert-info"
	    when 'success' then "alert-success"
	    when 'error' then "alert-danger"
	    when 'alert' then "alert-warning"
	  end
	end

end
