class NewsfeedQuery
  attr_reader :filter
  attr_reader :tags
  attr_reader :page
  attr_reader :posts_count
  attr_reader :raw_query
  attr_reader :sortby

  def initialize(url_params)
    populate_filter(url_params)
    populate_page(url_params)
    populate_posts_count(url_params)
    populate_tags(url_params)
    populate_sort(url_params)
    @raw_query = url_params
  end

  private

  def populate_filter(url_params)
    @filter = url_params.fetch(:filter).split(' ')
  rescue KeyError
    @filter = 'all'
  end

  def populate_tags(url_params)
    @tags = url_params.fetch(:tags).split(' ')
  rescue KeyError
    @tags = 'all'
  end

  def populate_page(url_params)
    @page = url_params.fetch(:page)
  rescue KeyError
    @page = 1
  end

  def populate_sort(url_params)
    @sortby = url_params.fetch(:sort_by)
  rescue KeyError
    @sortby = 'date'
  end

  def populate_posts_count(url_params)
    @posts_count = url_params.fetch(:posts_count)
  rescue KeyError
    @posts_count = 15
  end
end
