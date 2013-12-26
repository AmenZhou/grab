require 'test_helper'

class PostUloHousrentsControllerTest < ActionController::TestCase
  setup do
    @post_ulo_housrent = post_ulo_housrents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:post_ulo_housrents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post_ulo_housrent" do
    assert_difference('PostUloHousrent.count') do
      post :create, post_ulo_housrent: { content: @post_ulo_housrent.content, ct_name: @post_ulo_housrent.ct_name, detail_url: @post_ulo_housrent.detail_url, phone_n: @post_ulo_housrent.phone_n, rent_m: @post_ulo_housrent.rent_m, site_source: @post_ulo_housrent.site_source, title: @post_ulo_housrent.title, unique_code: @post_ulo_housrent.unique_code, up_time: @post_ulo_housrent.up_time, upload_time: @post_ulo_housrent.upload_time }
    end

    assert_redirected_to post_ulo_housrent_path(assigns(:post_ulo_housrent))
  end

  test "should show post_ulo_housrent" do
    get :show, id: @post_ulo_housrent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post_ulo_housrent
    assert_response :success
  end

  test "should update post_ulo_housrent" do
    patch :update, id: @post_ulo_housrent, post_ulo_housrent: { content: @post_ulo_housrent.content, ct_name: @post_ulo_housrent.ct_name, detail_url: @post_ulo_housrent.detail_url, phone_n: @post_ulo_housrent.phone_n, rent_m: @post_ulo_housrent.rent_m, site_source: @post_ulo_housrent.site_source, title: @post_ulo_housrent.title, unique_code: @post_ulo_housrent.unique_code, up_time: @post_ulo_housrent.up_time, upload_time: @post_ulo_housrent.upload_time }
    assert_redirected_to post_ulo_housrent_path(assigns(:post_ulo_housrent))
  end

  test "should destroy post_ulo_housrent" do
    assert_difference('PostUloHousrent.count', -1) do
      delete :destroy, id: @post_ulo_housrent
    end

    assert_redirected_to post_ulo_housrents_path
  end
end
