class Api::V1::UserController < ApplicationController
  def show
    render json: {user: current_user}
  end

end
