require 'test_helper'

class PostDdBusitransControllerTest < ActionController::TestCase
  setup do
    @post_dd_busitran = post_dd_busitrans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:post_dd_busitrans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post_dd_busitran" do
    assert_difference('PostDdBusitran.count') do
      post :create, post_dd_busitran: { content: @post_dd_busitran.content, ct_name: @post_dd_busitran.ct_name, detail_url: @post_dd_busitran.detail_url, phone_n: @post_dd_busitran.phone_n, rent_m: @post_dd_busitran.rent_m, site_source: @post_dd_busitran.site_source, title: @post_dd_busitran.title, unique_code: @post_dd_busitran.unique_code, up_time: @post_dd_busitran.up_time, upload_time: @post_dd_busitran.upload_time }
    end

    assert_redirected_to post_dd_busitran_path(assigns(:post_dd_busitran))
  end

  test "should show post_dd_busitran" do
    get :show, id: @post_dd_busitran
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post_dd_busitran
    assert_response :success
  end

  test "should update post_dd_busitran" do
    patch :update, id: @post_dd_busitran, post_dd_busitran: { content: @post_dd_busitran.content, ct_name: @post_dd_busitran.ct_name, detail_url: @post_dd_busitran.detail_url, phone_n: @post_dd_busitran.phone_n, rent_m: @post_dd_busitran.rent_m, site_source: @post_dd_busitran.site_source, title: @post_dd_busitran.title, unique_code: @post_dd_busitran.unique_code, up_time: @post_dd_busitran.up_time, upload_time: @post_dd_busitran.upload_time }
    assert_redirected_to post_dd_busitran_path(assigns(:post_dd_busitran))
  end

  test "should destroy post_dd_busitran" do
    assert_difference('PostDdBusitran.count', -1) do
      delete :destroy, id: @post_dd_busitran
    end

    assert_redirected_to post_dd_busitrans_path
  end
end
