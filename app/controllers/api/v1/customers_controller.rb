# class Api::V1::CustomersController < ApplicationController
#   def index
#     render json: Customer.all
#   end
#
#     def create
#       customer = Customer.new(customer_params)
#       if customer.save
#         render json: CustomerSerializer.new(customer), status: 201
#       else
#         render json: { error: "cannot create customer" }, status: :bad_request
#       end
#       # require "pry"; binding.pry
#     end
#
#   private
#   def customer_params
#     params.require(:customer).permit(:first_name, :last_name, :email, :address)
#   end
# end
#
