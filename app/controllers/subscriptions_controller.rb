class SubscriptionsController < ApplicationController

	def index
		@subscription = Subscription.find_by(user: current_user)
	end

	def new
		@subscription = Subscription.find_by(user: current_user)
	end

	#The 'create' action is in the 'application_controller' because its usefull for the 'charges_controller'

	def update
		
	end

	def destroy
		@subscription = Subscription.find_by(user: current_user)

		if @subscription.destroy
			flash[:success] = 'Votre abonnement à bien été supprimé'
			redirect_to user_path(current_user)
		else
			flash[:error] = 'Suite à un problème, votre abonnement n\'a pas été supprimé'
			redirect_to user_subscriptions_path(current_user)
		end
	end

end
