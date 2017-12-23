require 'rubyql'

class UserQuery < RubyQL
  def query
    result = User.includes(:posts).find_by(query_params)
    result.attributes unless result.nil?
  end
end