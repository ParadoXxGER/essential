class NewsfeedController < ApplicationController
  before_action :create_newsfeed_query, only: [:show]

  private

  def create_newsfeed_query
    @newsfeed_query = NewsfeedQuery.new(params)
  end
end
