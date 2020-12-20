class Api::V1::MoviesController < ApplicationController
  # allow only authorized users to access genres
  before_action :authenticate_request
  # allow only admin to edit delete update the genre
  before_action :check_administration ,only: [:update,:destroy,:create,:activate]

  before_action :set_movie, only: [:show, :update, :destroy, :activate]

  # GET /api/v1/movies
  def index
    @offset = params[:offset]
    @limit = params[:limit]

    if params[:type] == "newMovies"
      @movies = Movie.where("status = ?", :active).limit(4)

      # adding cover url on fly
      @movies = @movies.each do |m|
        m.movie_covers.each do |c|
          begin
            c.url = url_for(request.base_url + c.cover.url)
          rescue
            c.url = ""
          end
        end
      end

      @movies = @movies.as_json(
          :include =>
              [
                  :genres => {:only =>[:id, :title]},
                  :movie_covers => {:only =>[:id, :coverType, :url],:methods => :url}
              ]
      )

      render json:{success:true,
                   movies: @movies}




    elsif params[:type] == "latestMovies"
    @movies = Movie.where("status = ?",:active).limit(4)

      # adding cover url on fly
      @movies = @movies.each do |m|
        m.movie_covers.each do |c|
          begin
            c.url = request.base_url + c.cover.url
          rescue
            c.url = ""
          end
        end
      end

      @movies = @movies.as_json(
          :include =>
              [
                  :genres => {:only =>[:id, :title]},
                  :movie_covers => {:only =>[:id, :coverType, :url],:methods => :url}
              ]
      )

      render json:{success:true,
                   movies: @movies}




    elsif params[:type] == "fullMovies"
    @movies = Movie.where("movieType = ? AND status = ?", 1,:active).limit(6)

      # adding cover url on fly
      @movies = @movies.each do |m|
        m.movie_covers.each do |c|
          begin
            c.url = request.base_url + c.cover.url
          rescue
            c.url = ""
          end
        end
      end

      @movies = @movies.as_json(
          :include =>
              [
                  :genres => {:only =>[:id, :title]},
                  :movie_covers => {:only =>[:id, :coverType, :url],:methods => :url}
              ]
      )

      render json:{success:true,
                   movies: @movies}




    elsif params[:type] == "shortMovies"
      @movies = Movie.where("movieType = ? AND status = ?", 2,:active).limit(4)

      # adding cover url on fly
      @movies = @movies.each do |m|
        m.movie_covers.each do |c|
          begin
            c.url = request.base_url + c.cover.url
          rescue
            c.url = ""
          end
        end
      end

      @movies = @movies.as_json(
          :include =>
              [
                  :genres => {:only =>[:id, :title]},
                  :movie_covers => {:only =>[:id, :coverType, :url],:methods => :url}
              ]
      )

      render json:{success:true,
                   movies: @movies}







    elsif params[:type] == "AllFullMovies"

      @movies = Movie.where("movieType = ? AND status = ?", 1,:active).offset(@offset).limit(@limit)

      # adding cover url on fly
      @movies = @movies.each do |m|
        m.movie_covers.each do |c|
          begin
            c.url = request.base_url + c.cover.url
          rescue
            c.url = ""
          end
        end
      end

      @movies = @movies.as_json(
          :include =>
              [
                  :genres => {:only =>[:id, :title]},
                  :movie_covers => {:only =>[:id, :coverType, :url],:methods => :url}
              ]
      )

      render json:{success:true,
                   movies: @movies}





    elsif params[:type] == "AllLatestMovies"

      @movies = Movie.where("status = ?",:active).offset(@offset).limit(@limit).order(created_at: :desc)

      # adding cover url on fly
      @movies = @movies.each do |m|
        m.movie_covers.each do |c|
          begin
            c.url = request.base_url + c.cover.url
          rescue
            c.url = ""
          end
        end
      end

      @movies = @movies.as_json(
          :include =>
              [
                  :genres => {:only =>[:id, :title]},
                  :movie_covers => {:only =>[:id, :coverType, :url],:methods => :url}
              ]
      )

      render json:{success:true,
                   movies: @movies}




    elsif params[:type] == "AllShortMovies"

      @movies = Movie.where("movieType = ? AND status = ?", 2,:active).offset(@offset).limit(@limit)

      # adding cover url on fly
      @movies = @movies.each do |m|
        m.movie_covers.each do |c|
          begin
            c.url = request.base_url + c.cover.url
          rescue
            c.url = ""
          end
        end
      end

      @movies = @movies.as_json(
          :include =>
              [
                  :genres => {:only =>[:id, :title]},
                  :movie_covers => {:only =>[:id, :coverType, :url],:methods => :url}
              ]
      )

      render json:{success:true,
                   movies: @movies}

    elsif params[:type].present?
      @movies = Movie.joins(:genres).where("genres.title = ?",params[:type]).offset(@offset).limit(@limit)

      # adding cover url on fly
      @movies = @movies.each do |m|
        m.movie_covers.each do |c|
          begin
            c.url = request.base_url + c.cover.url
          rescue
            c.url = ""
          end
        end
      end

      @movies = @movies.as_json(
          :include =>
              [
                  :genres => {:only =>[:id, :title]},
                  :movie_covers => {:only =>[:id, :coverType, :url],:methods => :url}
              ]
      )

      render json:{success:true,
                   movies: @movies}
    else
      @movies = Movie.all

      # adding cover url on fly

      @movies = @movies.each do |m|
        m.movie_covers.each do |c|
          begin
            c.url = request.base_url + c.cover.url
          rescue
            c.url = ""
          end
        end
      end

      @movies = @movies.as_json(
          :include =>
              [
                  :genres => {:only =>[:id, :title]},
                  :movie_covers => {:only =>[:id, :coverType, :url],:methods => :url}
              ]
      )

      render json:{success:true,
                   movies: @movies}
    end

  end

  # GET /api/v1/movies/1
  def show

    # adding cover url on fly
    @movie.movie_covers.each do |c|
      begin
        c.url = request.base_url + c.cover.url
      rescue
        c.url = ""
      end
    end
    # adding movie stream url on fly
    @movie.movie_files.each do |c|
      c.streamURL = url_for(request.base_url + c.movie.url)
    end
    # @movie.movie_files.each do |c|
    #   c.file.purge
    # end
    @movie = @movie.as_json(
        :include =>
            [
                :genres => {:only =>[:id, :title]},
                :movie_covers => {:only =>[:id, :coverType, :url],:methods => :url},
                :movie_files => {:only =>[:id, :size, :resolutions, :streamURL],:methods => :streamURL}
            ]
    )

    render json:{success:true,
                 movie: @movie}
  end

  # POST /api/v1/movies
  def create

    @movie = Movie.new(movie_params.except(:movieGenres,:type))
    if @movie.save

      @movieGenres = movie_params[:movieGenres]

      # Add movie ID to each genres in all selected genres
      @movieGenres.each do |key|
        key[:movie_id] = @movie.id
        key[:id] = SecureRandom.uuid
        key[:created_at] = DateTime.now
        key[:updated_at] = DateTime.now
        key[:id] = SecureRandom.uuid

      end

      # Save All Movie Genres
      if MovieGenre.insert_all(@movieGenres)
        render json:{success: true,movie: @movie,movieGenres: @movieGenres}, status: :created
      else
        render json: @movieGenres.errors, status: :unprocessable_entity
      end


    else
      render json: @movie.errors, status: :unprocessable_entity
    end
    
  end

  # PATCH/PUT /api/v1/movies/1
  def update
    if @movie.update(movie_params.except(:movieGenres,:type))

      @movieGenres = movie_params[:movieGenres]
      # Add movie ID to each genres in all selected genres
      @movieGenres.each do |key|
        key[:movie_id] = @movie.id
        key[:id] = SecureRandom.uuid
        key[:created_at] = DateTime.now
        key[:updated_at] = DateTime.now
        key[:id] = SecureRandom.uuid
      end
      MovieGenre.where('movie_id = ?',@movie.id).delete_all
      # Save All Movie Genres
      if MovieGenre.insert_all(@movieGenres)
        render json:{success: true,movie: @movie,movieGenres: @movieGenres}, status: :created
      else
        render json: @movieGenres.errors, status: :unprocessable_entity
      end

    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/movies/1
  def destroy
    @movie.update(:softDelete => 1)
  end
  # PUT /api/v1/movie/activate
  def activate
    if @movie.update(:status => params[:status])


      render json:{success:true,status: @movie.status}
    else
      render json: {success: false,
                    error: @movie.errors}, status: :unprocessable_entity
    end

  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def movie_params
      params.require(:movie).permit(:imdbCode, :title, :titleEnglish, :titleLong, :movieType, :year, :runtime, :summary, :description, :ytTrailerCode, :status, :softDelete,:type, movieGenres: [:genre_id, :movie_id])
    end

end
