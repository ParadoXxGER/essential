class Newsfeed
  attr_reader :cached
  attr_reader :cache_key
  attr_reader :posts

  def initialize(cache_key, newsfeed_query)
    @cache_key = cache_key
    @newsfeed_query = newsfeed_query
    return use_cache(cache_key) if cache_active? && cache_key_exists?(cache_key)
    query_posts
    convert_date
    sort_tags
    sort_by(newsfeed_query.sortby)
    generate_output
    populate_cache if cache_active?
  end

  def sort_by(pattern)
    case pattern
    when 'weight'
      @posts.sort_by!(&:weight).reverse!
    end
  end

  private

  # Todo move into Controller
  def cache_active?
    if EssentialConfig::CACHE_ENABLED == 'true'
      @cached = true
      true
    else
      @cached = false
      false
    end
  end

  def cache_key_exists?(cache_key)
    if REDIS_CACHE_CLIENT.exists(cache_key)
      true
    else
      false
    end
  end

  def use_cache(cache_key)
    @posts = JSON.parse(REDIS_CACHE_CLIENT.get(cache_key))
  end

  def query_posts
    @posts = Post.includes(:user, :comments, :tags, :filter, :links, :photos)
                 .where('filters.text IN (?)', @newsfeed_query.filter)
                 .references(:user, :comments, :tags, :filter)
                 .page(@newsfeed_query.page)
                 .per(@newsfeed_query.posts_count)
                 .order(created_at: :desc)
  end

  def convert_date
    @posts = @posts.map do |post|
      post.created_at = post.created_at.strftime('%B %d %Y %H:%M')
      post
    end
  end

  def sort_tags
    @posts = @posts.map do |post|
      post.tags = post.tags.sort_by(&:text).reverse!
      post
    end
  end

  def add_weight
    @posts = @posts.map do |post|
      post.weight = 0
      post.tags.each do |tag|
        post.weight += 0.5 if @newsfeed_query.tags.include?(tag.text)
      end
      post
    end
  end

  def populate_cache
    REDIS_CACHE_CLIENT.set(@cache_key, @posts)
  end

  def generate_output
    @posts = @posts.to_json(
      include: {
        user: { only: %i[username id firstname lastname] },
        comments: { include: { user: { only: %i[username id firstname lastname] } } },
        tags: { only: [:text] },
        filter: { only: [:text] }
      },
      methods: [:weight]
    )
  end
end
