class Api::V1::SubscriptionsController < ApplicationController

  def index
    customer = Customer.find(params[:customer_id])
    render json: SubscriptionSerializer.new(customer.subscriptions)
  end

  def create
    if Subscription.new(subscrip_params).save
      render json: SubscriptionSerializer.new(Subscription.new(subscrip_params))
    else
      render json: {error: "Sorry. Cannot create subscription"}, status: :bad_request
    end
  end

  def cancel
    subscription = Subscription.find(params[:id])
    subscription.status = 'cancelled'
    subscription.save
    render json: SubscriptionSerializer.new(subscription), status: :ok
  end

private
  def subscrip_params
    params.permit(:tea_id, :customer_id, :title, :price, :frequency, :status)
  end
end
