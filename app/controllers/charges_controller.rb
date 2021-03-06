class ChargesController < ApplicationController
	before_action :signed_in_user

	def new
	end

	def create
	  #@user = User.find(params[:id])
	  # Amount in cents
	  @amount = 199

	  customer = Stripe::Customer.create(
	    :email => 'example@stripe.com',
	    :card  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => 'Twitter Clone Premium Account',
	    :currency    => 'usd'
	  )

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to charges_path
	end

end
