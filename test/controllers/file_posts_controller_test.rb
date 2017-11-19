require 'test_helper'

class FilePostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @file_post = file_posts(:one)
  end

  test 'should get index' do
    get file_posts_url
    assert_response :success
  end

  test 'should get new' do
    get new_file_post_url
    assert_response :success
  end

  test 'should create file_post' do
    assert_difference('FilePost.count') do
      post file_posts_url, params: { file_post: {} }
    end

    assert_redirected_to file_post_url(FilePost.last)
  end

  test 'should show file_post' do
    get file_post_url(@file_post)
    assert_response :success
  end

  test 'should get edit' do
    get edit_file_post_url(@file_post)
    assert_response :success
  end

  test 'should update file_post' do
    patch file_post_url(@file_post), params: { file_post: {} }
    assert_redirected_to file_post_url(@file_post)
  end

  test 'should destroy file_post' do
    assert_difference('FilePost.count', -1) do
      delete file_post_url(@file_post)
    end

    assert_redirected_to file_posts_url
  end
end
