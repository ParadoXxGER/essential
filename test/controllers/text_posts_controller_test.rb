require 'test_helper'

class TextPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @text_post = text_posts(:one)
  end

  test "should get index" do
    get text_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_text_post_url
    assert_response :success
  end

  test "should create text_post" do
    assert_difference('TextPost.count') do
      post text_posts_url, params: { text_post: {  } }
    end

    assert_redirected_to text_post_url(TextPost.last)
  end

  test "should show text_post" do
    get text_post_url(@text_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_text_post_url(@text_post)
    assert_response :success
  end

  test "should update text_post" do
    patch text_post_url(@text_post), params: { text_post: {  } }
    assert_redirected_to text_post_url(@text_post)
  end

  test "should destroy text_post" do
    assert_difference('TextPost.count', -1) do
      delete text_post_url(@text_post)
    end

    assert_redirected_to text_posts_url
  end
end
