class ChargesController < ApplicationController
	after_action :create_subscriber, only: [:create]

	def create
	  # Amount in cents
	  @amount = 36000

	  customer = Stripe::Customer.create({
	  	email: params[:stripeEmail],
	  	source: params[:stripeToken],
	  })

	  charge = Stripe::Charge.create({
	  	customer: customer.id,
	  	amount: @amount,
	  	description: 'Rails Stripe customer',
	  	currency: 'eur',
	  })

	rescue Stripe::CardError => e
		flash[:error] = e.message
		redirect_to new_user_subscription_path(current_user.id)
	end


end
