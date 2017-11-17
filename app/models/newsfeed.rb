class Newsfeed

  attr_reader :cached
  attr_reader :cache_key
  attr_reader :filter
  attr_reader :tags
  attr_reader :page
  attr_reader :posts_count
  attr_reader :posts

  def initialize(cache_key, filter, tags, page, posts_count)

    @filter = filter
    @tags = tags
    @page = page
    @posts_count = posts_count
    @cache_key = cache_key

    if EssentialConfig::CACHE_ENABLED == 'true' && REDIS_CACHE_CLIENT.exists(cache_key)
      @posts = JSON.parse(REDIS_CACHE_CLIENT.get(cache_key))
      @cached = true
    else
      @cached = false
      @posts = Post.includes(:user, :comments, :tags, :filter, :links, :photos)
                    .where("filters.text IN (?)", @filter)
                    .references(:user, :comments, :tags, :filter)
                    .page(@page)
                    .per(@posts)
                    .order(created_at: :desc)
      prepare_posts

      @posts = generate_output

      if EssentialConfig::CACHE_ENABLED == 'true'
        populate_cache
      end

    end
  end

  def sort_by(pattern)
    case pattern
      when 'weight'
        @posts.sort_by!(&:weight).reverse!
    end
  end

  private

  def prepare_posts
    @posts.map do |post|
      post.weight = 0
      post.created_at = post.created_at.strftime("%B %d %Y %H:%M")
      post.tags.each do |tag|
        if @tags.include?(tag.text)
          post.weight += 1
        else
          post.weight -= 0.5
        end
      end
      post.tags = post.tags.sort_by(&:text).reverse!
      post
    end
  end

  def populate_cache
    if EssentialConfig::CACHE_ENABLED == 'true'
      begin
        REDIS_CACHE_CLIENT.set(@cache_key, @posts)
      rescue
      end
      puts "CACHE SET: #{@cache_key}"
    end
  end

  def generate_output
    @posts.to_json(
      include: {
        user: {
          only: [:username, :id, :firstname, :lastname]
        },
        comments: {
          include: {
            user: { only: [:username, :id, :firstname, :lastname]}
          }
        },
        tags: {
          only: [:text]
        },
        filter: {
          only: [:text]
        }
      },
      methods: [:weight]
    )
  end

end