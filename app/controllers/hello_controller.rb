class HelloController < ApplicationController

  def show
    unless params[:page] || params[:posts_count]
      return redirect_to '/?page=1&posts_count=15'
    end
  end

end