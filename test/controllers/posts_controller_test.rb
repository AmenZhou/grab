require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @post = posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post :create, post: { content: @post.content, ct_name: @post.ct_name, detail_url: @post.detail_url, phone_n: @post.phone_n, rent_m: @post.rent_m, site_source: @post.site_source, title: @post.title, unique_code: @post.unique_code, upload_time: @post.upload_time }
    end

    assert_redirected_to post_path(assigns(:post))
  end

  test "should show post" do
    get :show, id: @post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post
    assert_response :success
  end

  test "should update post" do
    patch :update, id: @post, post: { content: @post.content, ct_name: @post.ct_name, detail_url: @post.detail_url, phone_n: @post.phone_n, rent_m: @post.rent_m, site_source: @post.site_source, title: @post.title, unique_code: @post.unique_code, upload_time: @post.upload_time }
    assert_redirected_to post_path(assigns(:post))
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post
    end

    assert_redirected_to posts_path
  end
end
