require 'test_helper'

class PostDdCarsControllerTest < ActionController::TestCase
  setup do
    @post_dd_car = post_dd_cars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:post_dd_cars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post_dd_car" do
    assert_difference('PostDdCar.count') do
      post :create, post_dd_car: { content: @post_dd_car.content, ct_name: @post_dd_car.ct_name, detail_url: @post_dd_car.detail_url, phone_n: @post_dd_car.phone_n, rent_m: @post_dd_car.rent_m, site_source: @post_dd_car.site_source, title: @post_dd_car.title, unique_code: @post_dd_car.unique_code, up_time: @post_dd_car.up_time, upload_time: @post_dd_car.upload_time }
    end

    assert_redirected_to post_dd_car_path(assigns(:post_dd_car))
  end

  test "should show post_dd_car" do
    get :show, id: @post_dd_car
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post_dd_car
    assert_response :success
  end

  test "should update post_dd_car" do
    patch :update, id: @post_dd_car, post_dd_car: { content: @post_dd_car.content, ct_name: @post_dd_car.ct_name, detail_url: @post_dd_car.detail_url, phone_n: @post_dd_car.phone_n, rent_m: @post_dd_car.rent_m, site_source: @post_dd_car.site_source, title: @post_dd_car.title, unique_code: @post_dd_car.unique_code, up_time: @post_dd_car.up_time, upload_time: @post_dd_car.upload_time }
    assert_redirected_to post_dd_car_path(assigns(:post_dd_car))
  end

  test "should destroy post_dd_car" do
    assert_difference('PostDdCar.count', -1) do
      delete :destroy, id: @post_dd_car
    end

    assert_redirected_to post_dd_cars_path
  end
end
