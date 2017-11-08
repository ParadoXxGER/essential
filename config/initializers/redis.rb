require "redis"

Rails.application.configure do
  REDIS_CLIENT = Redis.new(url: REDIS_CACHE_URL)
end
