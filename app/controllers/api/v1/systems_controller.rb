class Api::V1::SystemsController < ApplicationController
  # allow only authorized users to access genres
  before_action :authenticate_request, only: [:update,:destroy,:create]
  before_action :set_system, only: [:show, :update, :destroy]
  # allow only admin to edit delete update the genre
  before_action :check_administration ,only: [:update,:destroy,:create]
  # GET /systems
  def index
    @systems = System.first

    render json: @systems
  end

  # GET /systems/1
  def show
    render json: @system
  end

  # POST /systems
  def create
    @system = System.new(system_params)

    if @system.save
      render json: @system, status: :created, location: @system
    else
      render json: @system.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /systems/1
  def update
    if @system.update(system_params)
      render json: {success: true,system: @system}
    else
      render json: @system.errors, status: :unprocessable_entity
    end
  end

  # DELETE /systems/1
  def destroy
    @system.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_system
      @system = System.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def system_params
      params.require(:system).permit(:id, :title, :company_name, :about, :slogan, :email, :phone1, :phone2, :keywords, :address)
    end
end
