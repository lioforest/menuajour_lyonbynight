class SubscriptionsController < ApplicationController

	def index
		@title = "Mon abonnement"
		@subscription = Subscription.find_by(user: current_user)
	end

	def new
		@title = "S'abonner"
		@subscription = Subscription.find_by(user: current_user)
	end

	#The 'create' action is in the 'application_controller' because its usefull for the '

	def destroy
		@subscription = Subscription.find_by(user: current_user)

		if @subscription.destroy
			flash[:success] = 'Votre abonnement a bien été supprimé'
			redirect_to user_path(current_user)
		else
			flash[:error] = 'Suite à un problème, votre abonnement n\'a pas été supprimé'
			redirect_to user_subscriptions_path(current_user)
		end
	end

end
