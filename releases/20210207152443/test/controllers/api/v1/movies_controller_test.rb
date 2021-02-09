require 'test_helper'

class Api::V1::MoviesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_movie = api_v1_movies(:one)
  end

  test "should get index" do
    get api_v1_movies_url, as: :json
    assert_response :success
  end

  test "should create api_v1_movie" do
    assert_difference('Api::V1::Movie.count') do
      post api_v1_movies_url, params: { api_v1_movie: { description: @api_v1_movie.description, imdbCode: @api_v1_movie.imdbCode, runtime: @api_v1_movie.runtime, softDelete: @api_v1_movie.softDelete, status: @api_v1_movie.status, summary: @api_v1_movie.summary, title: @api_v1_movie.title, titleEnglish: @api_v1_movie.titleEnglish, titleLong: @api_v1_movie.titleLong, type: @api_v1_movie.type, year: @api_v1_movie.year, ytTrailerCode: @api_v1_movie.ytTrailerCode } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_movie" do
    get api_v1_movie_url(@api_v1_movie), as: :json
    assert_response :success
  end

  test "should update api_v1_movie" do
    patch api_v1_movie_url(@api_v1_movie), params: { api_v1_movie: { description: @api_v1_movie.description, imdbCode: @api_v1_movie.imdbCode, runtime: @api_v1_movie.runtime, softDelete: @api_v1_movie.softDelete, status: @api_v1_movie.status, summary: @api_v1_movie.summary, title: @api_v1_movie.title, titleEnglish: @api_v1_movie.titleEnglish, titleLong: @api_v1_movie.titleLong, type: @api_v1_movie.type, year: @api_v1_movie.year, ytTrailerCode: @api_v1_movie.ytTrailerCode } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_movie" do
    assert_difference('Api::V1::Movie.count', -1) do
      delete api_v1_movie_url(@api_v1_movie), as: :json
    end

    assert_response 204
  end
end
