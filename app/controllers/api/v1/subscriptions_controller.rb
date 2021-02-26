class Api::V1::SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show, :update, :destroy]
  # Allow only Authorized users
  before_action :authenticate_request, except: [:index]
  # Allow only Admin to update,Destroy Subscription
  before_action :check_administration ,only: [:update,:destroy]
  # GET /subscriptions
  def index
    @subscriptions = Subscription.all

    render json: @subscriptions
  end

  # GET user subscription
  def subscription
    # get user subscription
    @subscription = Subscription.where("user_id = ? AND status  = ?",@current_user.id,:active)
    if @subscription.present?
      render json: {success: true, subscription: @subscription}
    else
      render json: {success: false, message: "No Subscription Found"}
    end

  end
  # GET /subscriptions/1
  def show
    render json: @subscription
  end

  # POST /subscriptions
  def create
    # check if user is already subscribed and active and attempt to subscribe for another time.
    if Subscription.find_by_user_id(subscription_params[:user_id]).present? && Subscription.find_by_user_id(subscription_params[:user_id]).status == "active" && Subscription.find_by_user_id(subscription_params[:user_id]).transactionStatus == "SUCCESS"
      render json: {success: false,message: "You cant' subscribe more than once!"}
    else
      # create User's timezone
      @current_time = DateTime.now.in_time_zone(current_user.user_timezone)

      @subscription = Subscription.new(package_id: subscription_params[:package_id],
                                       user_id: subscription_params[:user_id],
                                       period_from:  @current_time,
                                       period_to:  @current_time + 1.months, # added 1hour from time we subscribed
                                       )
      if @subscription.save
        #getting system info
        @package = Package.find_by_id(subscription_params[:package_id])
        # gukora request
        request = Typhoeus::Request.new(
            ENV["APPLICATION_LOGIN_URL"],
            method: :post,
            body: { applicationId: ENV["APPLICATION_ID"],
                    username: ENV["PAYMENT_USERNAME"],
                    password: ENV["PAYMENT_PASSWORD"],
            },
            headers: { Accept: "application/json" }, followlocation: true,
            ssl_verifypeer: false,
            ssl_verifyhost: 0)

        request.on_complete do |response|
          # getting request's response
          if response.success?
            # hell yeah
            body = JSON.parse(response.body)
            # tokens = body["body"]["tokens"]
            # user = body["body"]["user"]
            organization = body["body"]["organization"]
            organization_id = organization["id"]

            # creating a request for initiation payment popup
            request2 = Typhoeus::Request.new(
                ENV["APPLICATION_PAYMENT_URL"],
                method: :post,
                body: { transaction_id: @subscription.id,
                        amount: 100.0,
                        telephoneNumber: "25" + subscription_params[:telephoneNumber],
                        organizationId: organization_id,
                        callbackUrl: "https://afrodrama.com/api/v1/callback",
                        description: "Payment for streaming "+@package.package_type+" Package Subscription."
                },
                headers: { Accept: "application/json" }, followlocation: true,
                ssl_verifypeer: false,
                ssl_verifyhost: 0)
            request2.on_complete do |response|
              # getting request's response
              if response.success?
                # hell yeah
                body = JSON.parse(response.body)
                #parameters to update in database
                description = body["description"]
                status = body["status"]
                transactionId = body["body"]["transactionId"]

                @subscription.update(statusDescription: description, transactionId: transactionId, transactionStatus: status)
                # show user a custom message whenever the status is pending waiting for user to proceed with payments
                render json: {success: true, message: @subscription.transactionStatus === "PENDING" ? "Type *182*7*1# to complete payment" : @subscription.statusDescription }, status: :created

              elsif response.timed_out?
                @subscription.destroy
                # aw hell no
                render json: "got a time out", status: :ok
              elsif response.code == 0
                @subscription.destroy
                # Could not get an http response, something's wrong.
                render json: {success: false, message: response.return_message}, status: :ok
              else
                # Received a non-successful http response.
                @subscription.destroy
                render json: {success: false, message: "HTTP request failed: " + response.code.to_s}, status: :ok
              end
            end
            # sending request
            request2.run

          elsif response.timed_out?
            @subscription.destroy
            # aw hell no
            render json: {success: false, message: "got a time out"}, status: :ok
          elsif response.code == 0
            @subscription.destroy
            # Could not get an http response, something's wrong.
            render json: {success: false, message: response.return_message}, status: :ok
          else
            @subscription.destroy
            # Received a non-successful http response.
            render json: {success: false, message: "HTTP request failed: " + response.code.to_s}, status: :ok
          end
        end
        # sending request
        request.run

      else
        render json: {success: false, message: @subscription.errors}, status: :unprocessable_entity
      end
    end

  end

  # PATCH/PUT /subscriptions/1
  def update
    if @subscription.update(subscription_params)
      render json: @subscription
    else
      render json: @subscription.errors, status: :unprocessable_entity
    end
  end

  # DELETE /subscriptions/1
  def destroy
    @subscription.destroy
  end
  private

    # Use callbacks to share common setup or constraints between actions.
    def set_subscription
      @subscription = Subscription.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def subscription_params
      params.require(:subscription).permit(:package_id, :user_id,:telephoneNumber, :period_from, :amount, :period_to, :status)
    end
end
