class Tag < ApplicationRecord
  belongs_to :post

  after_save :invalidate_cache_by_tag
  before_destroy :invalidate_cache_by_tag

  private

  def invalidate_cache_by_tag
    keys = REDIS_CACHE_CLIENT.keys("*tag-#{self.text}[-]*")
    keys.each do |key|
      puts "CACHE BUSTED: #{key} by tag '#{self.text}'"
      REDIS_CACHE_CLIENT.del(key)
    end
  end

end
