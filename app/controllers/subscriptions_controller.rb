class SubscriptionsController < ApplicationController

	def index
		
	end

	def new
		@subscription = Subscription.find_by(user: current_user)
	end

	def create
		
	end

	def update
		
	end

	def destroy
		
	end

end
