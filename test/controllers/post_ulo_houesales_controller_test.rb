require 'test_helper'

class PostUloHouesalesControllerTest < ActionController::TestCase
  setup do
    @post_ulo_houesale = post_ulo_houesales(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:post_ulo_houesales)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post_ulo_houesale" do
    assert_difference('PostUloHouesale.count') do
      post :create, post_ulo_houesale: { content: @post_ulo_houesale.content, ct_name: @post_ulo_houesale.ct_name, detail_url: @post_ulo_houesale.detail_url, phone_n: @post_ulo_houesale.phone_n, rent_m: @post_ulo_houesale.rent_m, site_source: @post_ulo_houesale.site_source, title: @post_ulo_houesale.title, unique_code: @post_ulo_houesale.unique_code, up_time: @post_ulo_houesale.up_time, upload_time: @post_ulo_houesale.upload_time }
    end

    assert_redirected_to post_ulo_houesale_path(assigns(:post_ulo_houesale))
  end

  test "should show post_ulo_houesale" do
    get :show, id: @post_ulo_houesale
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post_ulo_houesale
    assert_response :success
  end

  test "should update post_ulo_houesale" do
    patch :update, id: @post_ulo_houesale, post_ulo_houesale: { content: @post_ulo_houesale.content, ct_name: @post_ulo_houesale.ct_name, detail_url: @post_ulo_houesale.detail_url, phone_n: @post_ulo_houesale.phone_n, rent_m: @post_ulo_houesale.rent_m, site_source: @post_ulo_houesale.site_source, title: @post_ulo_houesale.title, unique_code: @post_ulo_houesale.unique_code, up_time: @post_ulo_houesale.up_time, upload_time: @post_ulo_houesale.upload_time }
    assert_redirected_to post_ulo_houesale_path(assigns(:post_ulo_houesale))
  end

  test "should destroy post_ulo_houesale" do
    assert_difference('PostUloHouesale.count', -1) do
      delete :destroy, id: @post_ulo_houesale
    end

    assert_redirected_to post_ulo_houesales_path
  end
end
