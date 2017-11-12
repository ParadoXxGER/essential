class Post < ApplicationRecord
  cti_base_class
  has_many :comments, dependent: :destroy
  has_many :photo_album_posts, dependent: :destroy
  has_many :text_posts, dependent: :destroy
  has_many :file_posts, dependent: :destroy
  has_many :filter
  has_many :tags

  belongs_to :user
  paginates_per 50

  attr_writer :type

  after_save :invalidate_cache_by_tag
  after_save :invalidate_cache_by_filter

  def purge_cache
    REDIS_CACHE_CLIENT.flushdb
  end

  private

  def invalidate_cache_by_filter
    self.filter.each do |filter|
      keys = REDIS_CACHE_CLIENT.keys("*filter-#{filter.text}[-]*")
      keys.each do |key|
        puts "CACHE BUSTED: #{key} by filter '#{filter.text}'"
        REDIS_CACHE_CLIENT.del(key)
      end
    end

  end

  def invalidate_cache_by_tag
    self.tags.each do |tag|
      keys = REDIS_CACHE_CLIENT.keys("*tag-#{tag.text}[-]*")
      keys.each do |key|
        puts "CACHE BUSTED: #{key} by tag '#{tag.text}'"
        REDIS_CACHE_CLIENT.del(key)
      end
    end

  end

end
