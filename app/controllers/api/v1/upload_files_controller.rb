class Api::V1::UploadFilesController < ApplicationController
  # allow only authorized users to access genres
  before_action :authenticate_request
  # allow only admin to edit delete update the genre
  before_action :check_administration ,only: [:uploadMovieCover]

  # POST /api/v1/uploadMovieCover
  def uploadMovieCover
    # check if there is any cover with the same type  and delete it we cant have more than one cover with the same type
    @covers = MovieCover.where('movie_id =? AND movie_covers.cover_type =?',params[:movie_id],params[:type])
    if @covers.count > 0
      @covers.each do |myCover|
        myCover.remove_cover
      end
      @covers.delete_all
    end

    # save the cover and upload it's file
    @movieCover = MovieCover.new(original_name: params[:name],size: params[:size],cover_type: params[:type],cover: params[:cover],movie_id: params[:movie_id])
    if @movieCover.save

      render json: {success: true, cover: @movieCover},status: :created

    else

      render json: {success: false, error: @movieCover.errors},status: :created

    end

  end

  # POST /api/v1/uploadMovieFile
  def uploadMovieFile
    # check if there are any movie with the same resolution and delete it
    @MyMovieFile = MovieFile.where("movie_id = ? AND resolutions = ?",params[:movie_id],params[:resolutions])

    if @MyMovieFile.blank?
      # upload new movie file
      @movieFile = MovieFile.new(original_name: params[:name], size: params[:size], resolutions: params[:resolutions], movie: params[:movie], movie_id: params[:movie_id])

      if @movieFile.save
        render json: {success: true, movieFile: @movieFile.movie}, status: :created
      else
        render json: {success: false, error: @movieFile.errors}, status: :created
      end
    else
      # check if file exist or not.
      @movieURL = ""
      @MyMovieFile.each do |movie|
        movie.remove_movie!
        movie.save!
      end
      @MyMovieFile.delete_all
      # upload new movie file
      @movieFile = MovieFile.new(original_name: params[:name], size: params[:size], resolutions: params[:resolutions], movie: params[:movie], movie_id: params[:movie_id])

      if @movieFile.save
        render json: {success: true, movieFile: @movieFile.movie}, status: :created
      else
        render json: {success: false, error: @movieFile.errors}, status: :created
      end

    end

  end
end
