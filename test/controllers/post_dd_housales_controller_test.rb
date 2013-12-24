require 'test_helper'

class PostDdHousalesControllerTest < ActionController::TestCase
  setup do
    @post_dd_housale = post_dd_housales(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:post_dd_housales)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post_dd_housale" do
    assert_difference('PostDdHousale.count') do
      post :create, post_dd_housale: { content: @post_dd_housale.content, ct_name: @post_dd_housale.ct_name, detail_url: @post_dd_housale.detail_url, phone_n: @post_dd_housale.phone_n, rent_m: @post_dd_housale.rent_m, site_source: @post_dd_housale.site_source, title: @post_dd_housale.title, unique_code: @post_dd_housale.unique_code, up_time: @post_dd_housale.up_time, upload_time: @post_dd_housale.upload_time }
    end

    assert_redirected_to post_dd_housale_path(assigns(:post_dd_housale))
  end

  test "should show post_dd_housale" do
    get :show, id: @post_dd_housale
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post_dd_housale
    assert_response :success
  end

  test "should update post_dd_housale" do
    patch :update, id: @post_dd_housale, post_dd_housale: { content: @post_dd_housale.content, ct_name: @post_dd_housale.ct_name, detail_url: @post_dd_housale.detail_url, phone_n: @post_dd_housale.phone_n, rent_m: @post_dd_housale.rent_m, site_source: @post_dd_housale.site_source, title: @post_dd_housale.title, unique_code: @post_dd_housale.unique_code, up_time: @post_dd_housale.up_time, upload_time: @post_dd_housale.upload_time }
    assert_redirected_to post_dd_housale_path(assigns(:post_dd_housale))
  end

  test "should destroy post_dd_housale" do
    assert_difference('PostDdHousale.count', -1) do
      delete :destroy, id: @post_dd_housale
    end

    assert_redirected_to post_dd_housales_path
  end
end
