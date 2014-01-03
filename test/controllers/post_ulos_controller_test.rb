require 'test_helper'

class PostUlosControllerTest < ActionController::TestCase
  setup do
    @post_ulo = post_ulos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:post_ulos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post_ulo" do
    assert_difference('PostUlo.count') do
      post :create, post_ulo: { content: @post_ulo.content, ct_name: @post_ulo.ct_name, detail_url: @post_ulo.detail_url, phone_n: @post_ulo.phone_n, rent_m: @post_ulo.rent_m, site_source: @post_ulo.site_source, title: @post_ulo.title, unique_code: @post_ulo.unique_code, up_time: @post_ulo.up_time, upload_time: @post_ulo.upload_time }
    end

    assert_redirected_to post_ulo_path(assigns(:post_ulo))
  end

  test "should show post_ulo" do
    get :show, id: @post_ulo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post_ulo
    assert_response :success
  end

  test "should update post_ulo" do
    patch :update, id: @post_ulo, post_ulo: { content: @post_ulo.content, ct_name: @post_ulo.ct_name, detail_url: @post_ulo.detail_url, phone_n: @post_ulo.phone_n, rent_m: @post_ulo.rent_m, site_source: @post_ulo.site_source, title: @post_ulo.title, unique_code: @post_ulo.unique_code, up_time: @post_ulo.up_time, upload_time: @post_ulo.upload_time }
    assert_redirected_to post_ulo_path(assigns(:post_ulo))
  end

  test "should destroy post_ulo" do
    assert_difference('PostUlo.count', -1) do
      delete :destroy, id: @post_ulo
    end

    assert_redirected_to post_ulos_path
  end
end
