require 'test_helper'

class PostUloBusitransControllerTest < ActionController::TestCase
  setup do
    @post_ulo_busitran = post_ulo_busitrans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:post_ulo_busitrans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post_ulo_busitran" do
    assert_difference('PostUloBusitran.count') do
      post :create, post_ulo_busitran: { content: @post_ulo_busitran.content, ct_name: @post_ulo_busitran.ct_name, detail_url: @post_ulo_busitran.detail_url, phone_n: @post_ulo_busitran.phone_n, rent_m: @post_ulo_busitran.rent_m, site_source: @post_ulo_busitran.site_source, title: @post_ulo_busitran.title, unique_code: @post_ulo_busitran.unique_code, up_time: @post_ulo_busitran.up_time, upload_time: @post_ulo_busitran.upload_time }
    end

    assert_redirected_to post_ulo_busitran_path(assigns(:post_ulo_busitran))
  end

  test "should show post_ulo_busitran" do
    get :show, id: @post_ulo_busitran
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post_ulo_busitran
    assert_response :success
  end

  test "should update post_ulo_busitran" do
    patch :update, id: @post_ulo_busitran, post_ulo_busitran: { content: @post_ulo_busitran.content, ct_name: @post_ulo_busitran.ct_name, detail_url: @post_ulo_busitran.detail_url, phone_n: @post_ulo_busitran.phone_n, rent_m: @post_ulo_busitran.rent_m, site_source: @post_ulo_busitran.site_source, title: @post_ulo_busitran.title, unique_code: @post_ulo_busitran.unique_code, up_time: @post_ulo_busitran.up_time, upload_time: @post_ulo_busitran.upload_time }
    assert_redirected_to post_ulo_busitran_path(assigns(:post_ulo_busitran))
  end

  test "should destroy post_ulo_busitran" do
    assert_difference('PostUloBusitran.count', -1) do
      delete :destroy, id: @post_ulo_busitran
    end

    assert_redirected_to post_ulo_busitrans_path
  end
end
