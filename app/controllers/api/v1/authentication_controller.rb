class Api::V1::AuthenticationController < ApplicationController
  # skip authorization checks because it's public resource
  skip_before_action :authenticate_request
  before_action :authenticate_request,only: [:checkAuth]
  # user login
  def authenticate

    command = AuthenticateUser.call(params['email'],params['password'])
    if command.success?
      user = User.find_by_email(params['email'])

      render json: {
          success: true,
          token: command.result,
          user: user.as_json(:except => (:password_digest)),
          location: location

      }
    else
      render json: {success: false, error: command.errors}, status: :ok
    end
  end

  def checkAuth
    render json: {success: true,user: @current_user.as_json(:except => (:password_digest))}
  end
  # user registration
  def registration
    # get user's location and ip for Timezone.
    user_ip = request.remote_ip
    location = Geocoder.search(user_ip)
    user_city      = location["data"]["city"].to_s
    user_region    = location["data"]["region"].to_s
    user_country   = location["data"]["country"].to_s
    user_timezone  = location["data"]["timezone"].to_s
    user_location  = location["data"]["loc"].to_s
    @user  = User.new(first_name: params['firstName'],
                      last_name: params['lastName'],
                      email: params['email'],
                      password: params['password'],
                      password_confirmation: params['passwordConfirmation'],
                      user_city: user_city,
                      user_region: user_region,
                      user_country: user_country,
                      user_timezone: user_timezone,
                      user_location: user_location)

    if @user.invalid?
      render json: {success: false,error: @user.errors.messages}

    else

      if @user.save!
        render json: {
            success: true,

            message: "Account was successfully created!"
        },status: :created
        UserAccountCreatedMailer.with(user: @user,system: System.first).welcome_email.deliver_now
      end

    end


  end
end
