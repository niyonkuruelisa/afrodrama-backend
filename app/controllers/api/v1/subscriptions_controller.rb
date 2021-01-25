class Api::V1::SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show, :update, :destroy]
  # Allow only Authorized users
  before_action :authenticate_request
  # Allow only Admin to update,Destroy Subscription
  before_action :check_administration ,only: [:update,:destroy]
  # GET /subscriptions
  def index
    @subscriptions = Subscription.all

    render json: @subscriptions
  end

  # GET /subscriptions/1
  def show
    render json: @subscription
  end

  # POST /subscriptions
  def create
    # check if user is already subscribed and active
    if Subscription.find_by_user_id(subscription_params[:user_id]).present? && Subscription.find_by_user_id(subscription_params[:user_id]).status == "active"
      render json: {success: false,error: "You cant' subscribe more than once!"}
    else
      @current_time = Time.now.utc + 7200
      @subscription = Subscription.new(package_id: subscription_params[:package_id],
                                       user_id: subscription_params[:user_id],
                                       period_from:  @current_time,
                                       period_to:  @current_time + 3600, # added 1hour from time we subscribed
                                       )

      if @subscription.save
        render json: @subscription, status: :created
      else
        render json: @subscription.errors, status: :unprocessable_entity
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
      params.require(:subscription).permit(:package_id, :user_id, :period_from, :period_to, :status)
    end
end
