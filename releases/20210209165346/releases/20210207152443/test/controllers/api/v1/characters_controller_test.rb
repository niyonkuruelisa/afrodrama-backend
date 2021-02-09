require 'test_helper'

class Api::V1::CharactersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_character = api_v1_characters(:one)
  end

  test "should get index" do
    get api_v1_characters_url, as: :json
    assert_response :success
  end

  test "should create api_v1_character" do
    assert_difference('Api::V1::Character.count') do
      post api_v1_characters_url, params: { api_v1_character: { email: @api_v1_character.email, names: @api_v1_character.names, phone: @api_v1_character.phone } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_character" do
    get api_v1_character_url(@api_v1_character), as: :json
    assert_response :success
  end

  test "should update api_v1_character" do
    patch api_v1_character_url(@api_v1_character), params: { api_v1_character: { email: @api_v1_character.email, names: @api_v1_character.names, phone: @api_v1_character.phone } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_character" do
    assert_difference('Api::V1::Character.count', -1) do
      delete api_v1_character_url(@api_v1_character), as: :json
    end

    assert_response 204
  end
end
