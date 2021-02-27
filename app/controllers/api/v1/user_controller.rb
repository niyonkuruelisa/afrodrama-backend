class Api::V1::UserController < ApplicationController
  before_action :set_user, only: [:update]
  # PATCH/PUT /user
  before_action :authenticate_request, only: [:update]
  def show
    render json: {success: true,user: current_user}
  end
  # PATCH/PUT /user/:id
  def update
    if @user.update(user_params)
      render json: {success: true,user: @user}
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:user][:id])
  end
  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:id, :first_name, :last_name, :email, :phone_number,:status)
  end

end
