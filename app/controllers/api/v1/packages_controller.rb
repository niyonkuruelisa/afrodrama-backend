class Api::V1::PackagesController < ApplicationController
  # allow only authorized users to access Packages
  before_action :authenticate_request, only: [:update,:destroy,:create]
  before_action :set_package, only: [:show, :update, :destroy]
  # allow only admin to edit delete update the Packages
  before_action :check_administration ,only: [:update,:destroy,:create]
  # GET /packages
  def index
    @packages = Package.all

    render json: {success: true,packages: @packages}
  end
  # GET /packages/1
  def show
    render json: {success: true,package: @packages}
  end
  # POST /packages
  def create
    @package = Package.new(package_params)

    if @package.save
      render json: {success: true,package: @package}, status: :created
    else
      render json: @package.errors, status: :unprocessable_entity
    end

  end
  # PATCH/PUT /packages/1
  def update
    if @package.update(package_params)
      render json: {success: true,package: @package}
    else
      render json: @package.errors, status: :unprocessable_entity
    end
  end

  # DELETE /packages/1
  def destroy
    @package.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_package
      @package = Package.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def package_params
      params.require(:package).permit(:id, :package_type, :name, :discount, :amount, :status)
    end
end
