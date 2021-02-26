class Api::V1::PaymentController < ApplicationController
  before_action :authenticate_request, except: [:callback]
  # POST api/v1/callback
  def callback
    begin
      # get all callback response data
      @statusCode  = params[:statusCode]
      @transactionId  = params[:transactionId]
      # find the subscription to update
      @subscription = Subscription.find_by_transactionId(params[:transactionId])
      begin
        @subscription.update(statusDescription: params[:statusDescription],
                             spTransactionId: params[:spTransactionId],
                             walletTransactionId: params[:walletTransactionId],
                             chargedCommission: params[:chargedCommission],
                             currency: params[:currency],
                             paidAmount: params[:paidAmount],
                             transactionStatus: params[:status])

        if @statusCode === "200"
          render json: {success: true}

        else
          render json: {success: false}

        end
      rescue
        render json: {success: false, message: "couldn't find subscription with transaction id " + @transactionId}
      end
    rescue
      render json: {success: false, message: "Invalid input parameters"}
    end
  end
end
