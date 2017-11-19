require 'test_helper'

class AbstractPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @abstract_post = abstract_posts(:one)
  end

  test 'should get index' do
    get abstract_posts_url
    assert_response :success
  end

  test 'should get new' do
    get new_abstract_post_url
    assert_response :success
  end

  test 'should create abstract_post' do
    assert_difference('AbstractPost.count') do
      post abstract_posts_url, params: { abstract_post: {} }
    end

    assert_redirected_to abstract_post_url(AbstractPost.last)
  end

  test 'should show abstract_post' do
    get abstract_post_url(@abstract_post)
    assert_response :success
  end

  test 'should get edit' do
    get edit_abstract_post_url(@abstract_post)
    assert_response :success
  end

  test 'should update abstract_post' do
    patch abstract_post_url(@abstract_post), params: { abstract_post: {} }
    assert_redirected_to abstract_post_url(@abstract_post)
  end

  test 'should destroy abstract_post' do
    assert_difference('AbstractPost.count', -1) do
      delete abstract_post_url(@abstract_post)
    end

    assert_redirected_to abstract_posts_url
  end
end
