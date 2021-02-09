class ApplicationController < ActionController::API
  # before accessing any resources make sure that a user is authorized
  before_action :authenticate_request
  attr_reader :current_user

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end

  # only allow admin to get all access to the system
  def check_administration
    @admin = current_user if current_user.role == 'admin'
    render json: { error: 'Not Authorized As Admin' }, status: 401 unless @admin
  end
end
