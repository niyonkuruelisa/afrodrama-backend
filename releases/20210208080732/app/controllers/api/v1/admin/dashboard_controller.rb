class Api::V1::Admin::DashboardController < ApplicationController
  before_action :check_administration

  # all necessary dashboard data
  def dashboard
    @totalUsers = User.where("role = ? ", 'user').count

    @totalGenres = Genre.count
    @totalMovieCharacters = Character.count

    render json: {
        success: :true,
        totalUsers: @totalUsers,
        totalGenres: @totalGenres,
        totalMovieCharacters: @totalMovieCharacters,
    }
  end

  private

  # only allow admin to get all access to the system
  def check_administration
    @admin = current_user if current_user.role == 'admin'
    render json: { error: 'Not Authorized As Admin' }, status: 401 unless @admin
  end

end
