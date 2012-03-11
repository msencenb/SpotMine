require 'test_helper'

class SpotListingsControllerTest < ActionController::TestCase
  setup do
    @spot_listing = spot_listings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:spot_listings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create spot_listing" do
    assert_difference('SpotListing.count') do
      post :create, spot_listing: @spot_listing.attributes
    end

    assert_redirected_to spot_listing_path(assigns(:spot_listing))
  end

  test "should show spot_listing" do
    get :show, id: @spot_listing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @spot_listing
    assert_response :success
  end

  test "should update spot_listing" do
    put :update, id: @spot_listing, spot_listing: @spot_listing.attributes
    assert_redirected_to spot_listing_path(assigns(:spot_listing))
  end

  test "should destroy spot_listing" do
    assert_difference('SpotListing.count', -1) do
      delete :destroy, id: @spot_listing
    end

    assert_redirected_to spot_listings_path
  end
end
