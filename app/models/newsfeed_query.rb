class NewsfeedQuery
  attr_reader :filter
  attr_reader :tags
  attr_reader :page
  attr_reader :posts_count
  attr_reader :raw_query

  def initialize(url_params)
    populate_filter(url_params)
    populate_page(url_params)
    populate_posts_count(url_params)
    populate_tags(url_params)
    @raw_query = url_params
  end

  private

  def populate_filter(url_params)
    begin
      @filter = url_params.fetch(:filter).split(' ')
    rescue KeyError
      @filter = 'all'
    end
  end

  def populate_tags(url_params)
    begin
      @tags = url_params.fetch(:tags).split(' ')
    rescue KeyError
      @tags = 'all'
    end
  end

  def populate_page(url_params)
    begin
      @page = url_params.fetch(:page)
    rescue KeyError
      @page = 'all'
    end
  end

  def populate_posts_count(url_params)
    begin
      @posts_count = url_params.fetch(:posts_count)
    rescue KeyError
      @posts_count = 'all'
    end
  end
end
