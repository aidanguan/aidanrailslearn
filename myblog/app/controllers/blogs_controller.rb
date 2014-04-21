class BlogsController < ApplicationController
  layout 'blog_layout'

  def index
    @articles = Article.order("created_at desc")
  end

end
