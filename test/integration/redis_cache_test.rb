require 'test_helper'

class RedisCacheIntegrationTest < ActionDispatch::IntegrationTest
  test 'A response from redis' do
    array = REDIS_CACHE_CLIENT.keys '*'
    assert(array).is_a?(Array)
  end
end
