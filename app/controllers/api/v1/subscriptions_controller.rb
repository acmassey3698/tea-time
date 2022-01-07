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
       render json: SubscriptionSerializer.one_sub(subscription), status: :created
     else
       render json: { errors: subscription.errors.full_messages }, status: :unprocessable_entity
     end
  end

  def update
    subscription = Subscription.find(params[:id])

    if subscription.update(subscription_params)
      render json: SubscriptionSerializer.one_sub(subscription), status: :accepted
    else
      render json: { errors: subscription.errors.full_messages }, status: :bad_request
    end
  end


  private

  def subscription_params
    params.permit(:status)
  end
end
