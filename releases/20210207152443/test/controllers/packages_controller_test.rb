require 'test_helper'

class PackagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @package = packages(:one)
  end

  test "should get index" do
    get packages_url, as: :json
    assert_response :success
  end

  test "should create package" do
    assert_difference('Package.count') do
      post packages_url, params: { package: { amount: @package.amount, id: @package.id, status: @package.status, type: @package.type } }, as: :json
    end

    assert_response 201
  end

  test "should show package" do
    get package_url(@package), as: :json
    assert_response :success
  end

  test "should update package" do
    patch package_url(@package), params: { package: { amount: @package.amount, id: @package.id, status: @package.status, type: @package.type } }, as: :json
    assert_response 200
  end

  test "should destroy package" do
    assert_difference('Package.count', -1) do
      delete package_url(@package), as: :json
    end

    assert_response 204
  end
end
