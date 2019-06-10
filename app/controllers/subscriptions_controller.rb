class SubscriptionsController < ApplicationController

	def index
		@subscription = Subscription.find_by(user: current_user)
	end

	def new
		@subscription = Subscription.find_by(user: current_user)
	end

	def create
		
	end

	def update
		
	end

	def destroy
		@subscription = Subscription.find_by(user: current_user)

		if @subscription.destroy
			flash[:sucess] = 'Votre abonnement à bien été supprimé'
			redirect_to user_path(current_user)
		else
			flash[:warning] = 'Suite à un problème, votre abonnement n\'a pas été supprimé'
			redirect_to user_subscriptions_path(current_user)
		end
	end

end
