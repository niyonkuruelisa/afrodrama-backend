class Api::V1::CharactersController < ApplicationController
  # allow only authorized users to access genres
  before_action :authenticate_request
  # allow only admin to edit delete update the genre
  before_action :check_administration ,only: [:update,:destroy,:create]
  before_action :set_character, only: [:show, :update, :destroy]

  # GET /api/v1/characters
  def index
    @characters = Character.all

    render json: {success: true,characters: @characters.order(created_at: :desc)}
  end

  # GET /api/v1/characters/1
  def show
    render json: @character
  end

  # POST /api/v1/characters
  def create
    @character = Character.new(character_params)

    if @character.save
      render json: {success: true,character: @character}, status: :created
    else
      render json: {success: false,error: @character.errors}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/characters/1
  def update
    if @character.update(character_params)
      render json: {success: true,character: @character}
    else
      render json: {success: true,character: @character}, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/characters/1
  def destroy

    @character.softDelete = 1
    if @character.save
      render json: {success: true,message: "Character ( #{@character.title} ) is successfully deleted"}
    else
      render json: @character.errors, status: :unprocessable_entity
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character
      @character = Character.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def character_params
      params.require(:character).permit(:names, :email, :phone, :age)
    end

end
