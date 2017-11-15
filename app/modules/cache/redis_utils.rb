module RedisUtils

  def set(key, value)
    return if precheck_fails?
    REDIS_CACHE_CLIENT.set(key, value)
  end

  def del(key)
    return if precheck_fails?
    REDIS_CACHE_CLIENT(key)
  end

  def keys(pattern)
    return if precheck_fails?
    REDIS_CACHE_CLIENT.keys(pattern)
  end

  def flushdb
    return if precheck_fails?
    REDIS_CACHE_CLIENT.flushdb
  end

  def exists?(key)
    return if precheck_fails?
    REDIS_CACHE_CLIENT.exists(key)
  end

  private

  def precheck_fails?
    if RAILS_ENV == 'development'
      puts "Cache is not active"
      return true
    end

    unless REDIS_CACHE_CLIENT.is_a(Redis)
      puts "Check your cache Class, it seems that this is not a Redis"
      return true
    end
    false
  end

end