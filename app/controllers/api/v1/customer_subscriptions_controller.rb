class Api::V1::CustomerSubscriptionsController < ApplicationController
  def index
    customer_subs = Customer.find(params[:id]).subscriptions
    render json: CustomerSubscriptionsSerializer.subscriptions(customer_subs), status: :ok
  end
end
