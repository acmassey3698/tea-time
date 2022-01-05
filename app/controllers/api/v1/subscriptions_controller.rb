class Api::V1::SubscriptionsController < ApplicationController
  def create
    customer = Customer.find_by(email: params[:customer_email])
    tea = Tea.find_by(name: params[:tea_name])
    subscription = Subscription.new(
      tea: tea,
      customer: customer,
      frequency: params[:frequency]
     )
     if subscription.save
       render json: SubscriptionSerializer.one_sub(subscription), status: 201
     end
  end
end
