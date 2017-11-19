require 'test_helper'

class PhotoAlbumPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @photo_album_post = photo_album_posts(:one)
  end

  test 'should get index' do
    get photo_album_posts_url
    assert_response :success
  end

  test 'should get new' do
    get new_photo_album_post_url
    assert_response :success
  end

  test 'should create photo_album_post' do
    assert_difference('PhotoAlbumPost.count') do
      post photo_album_posts_url, params: { photo_album_post: {} }
    end

    assert_redirected_to photo_album_post_url(PhotoAlbumPost.last)
  end

  test 'should show photo_album_post' do
    get photo_album_post_url(@photo_album_post)
    assert_response :success
  end

  test 'should get edit' do
    get edit_photo_album_post_url(@photo_album_post)
    assert_response :success
  end

  test 'should update photo_album_post' do
    patch photo_album_post_url(@photo_album_post), params: { photo_album_post: {} }
    assert_redirected_to photo_album_post_url(@photo_album_post)
  end

  test 'should destroy photo_album_post' do
    assert_difference('PhotoAlbumPost.count', -1) do
      delete photo_album_post_url(@photo_album_post)
    end

    assert_redirected_to photo_album_posts_url
  end
end
