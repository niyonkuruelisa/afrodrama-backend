class Api::V1::AuthenticationController < ApplicationController
  # skip authorization checks because it's public resource
  skip_before_action :authenticate_request
  # user login
  def authenticate

    command = AuthenticateUser.call(params['email'],params['password'])
    if command.success?
      user = User.find_by_email(params['email'])
      render json: {
          success: true,
          token: command.result,
          user: user.as_json(:except => (:password_digest))
      }
    else
      render json: {success: false, error: command.errors}, status: :ok
    end
  end

  # user registration
  def registration

    @user  = User.new(firstName: params['firstName'],
                     lastName: params['lastName'],
                     email: params['email'],
                     password: params['password'],
                     password_confirmation: params['passwordConfirmation'])

    if @user.invalid?
      render json: {success: false,error: @user.errors.messages}

    else

      if @user.save!
        render json: {
            success: true,
            message: "Account was successfully created!"
        },status: :created
      end

    end

  end
end
