require 'test_helper'

class PostRecruitsControllerTest < ActionController::TestCase
  setup do
    @post_recruit = post_recruits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:post_recruits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post_recruit" do
    assert_difference('PostRecruit.count') do
      post :create, post_recruit: { content: @post_recruit.content, ct_name: @post_recruit.ct_name, detail_url: @post_recruit.detail_url, phone_n: @post_recruit.phone_n, rent_m: @post_recruit.rent_m, site_source: @post_recruit.site_source, title: @post_recruit.title, unique_code: @post_recruit.unique_code, up_time: @post_recruit.up_time, upload_time: @post_recruit.upload_time }
    end

    assert_redirected_to post_recruit_path(assigns(:post_recruit))
  end

  test "should show post_recruit" do
    get :show, id: @post_recruit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post_recruit
    assert_response :success
  end

  test "should update post_recruit" do
    patch :update, id: @post_recruit, post_recruit: { content: @post_recruit.content, ct_name: @post_recruit.ct_name, detail_url: @post_recruit.detail_url, phone_n: @post_recruit.phone_n, rent_m: @post_recruit.rent_m, site_source: @post_recruit.site_source, title: @post_recruit.title, unique_code: @post_recruit.unique_code, up_time: @post_recruit.up_time, upload_time: @post_recruit.upload_time }
    assert_redirected_to post_recruit_path(assigns(:post_recruit))
  end

  test "should destroy post_recruit" do
    assert_difference('PostRecruit.count', -1) do
      delete :destroy, id: @post_recruit
    end

    assert_redirected_to post_recruits_path
  end
end
