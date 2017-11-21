module Api
  module V1
    class NewsfeedController < ApiController
      def index
        @newsfeed_query = NewsfeedQuery.new(params)

        newsfeed = Newsfeed.new(
          cachekey,
          @newsfeed_query
        )

        if newsfeed.cached
          set_cache_header('X-Cache-Hit', newsfeed.cache_key)
          return render json: newsfeed.posts
        end

        set_cache_header('X-Cache-Miss', newsfeed.cache_key)
        render json: newsfeed.posts
      end

      private

      def cachekey
        reorder_filter
        reorder_tags
        @newsfeed_query.raw_query[:filter].parameterize.to_s <<
          "-#{@newsfeed_query.raw_query[:tags].parameterize}" <<
          "-page:#{@newsfeed_query.page}" <<
          "-posts:#{@newsfeed_query.posts_count}"
      end

      def set_cache_header(key, value)
        response.set_header(key, value)
      end

      def reorder_filter
        @newsfeed_query.filter.map { |filter| "filter-#{filter}" }.sort!.reverse!.join(' ')
      end

      def reorder_tags
        @newsfeed_query.tags.map { |tag| "tag-#{tag}" }.sort!.reverse!.join(' ')
      end
    end
  end
end
