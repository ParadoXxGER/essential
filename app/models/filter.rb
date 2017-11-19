class Filter < ApplicationRecord
  belongs_to :post

  after_save :invalidate_cache_by_filter
  before_destroy :invalidate_cache_by_filter

  private

  def invalidate_cache_by_filter
    keys = REDIS_CACHE_CLIENT.keys("*filter-#{text}[-]*")
    keys.each do |key|
      puts "CACHE BUSTED: #{key} by filter '#{text}'"
      REDIS_CACHE_CLIENT.del(key)
    end
  end
end
