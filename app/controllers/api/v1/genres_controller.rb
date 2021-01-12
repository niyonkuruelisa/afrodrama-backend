class Api::V1::GenresController < ApplicationController
  # allow only authorized users to access genres
  before_action :authenticate_request
  before_action :set_genre, only: [:show, :update, :destroy]
  # allow only admin to edit delete update the genre
  before_action :check_administration ,only: [:update,:destroy,:create]
  # GET /genres
  def index

    # for users
    # @genres = Genre.where('softDelete != ?',1).all
    #for admin
    @genres = Genre.all
    render json: {success: true,genres: @genres.order(created_at: :desc),totalGenres: @genres.count,activeGenres: @genres.where('soft_delete = false').order(created_at: :desc)}
  end

  # GET /genres/1
  def show
    render json: {success: true,genre: @genre}
  end

  # POST /genres
  def create
    @genre = Genre.new(genre_params)

    if @genre.save
      render json: {success: true,genre: @genre}, status: :created
    else
      render json: @genre.errors, status: :unprocessable_entity
    end

  end

  # PATCH/PUT /genres/1
  def update
    if @genre.update(genre_params)
      render json: {success: true,genre: @genre}
    else
      render json: @genre.errors, status: :unprocessable_entity
    end
  end

  # DELETE /genres/1
  def destroy
    @genre.softDelete = true
    if @genre.save
      render json: {success: true,message: "Genre ( #{@genre.title} ) is successfully deleted"}
    else
      render json: @genre.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_genre
      @genre = Genre.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def genre_params
      params.require(:genre).permit(:title,:description,:id)
    end
end
