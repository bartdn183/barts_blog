class HomeController < ApplicationController
  def index
  	@blog_posts = BlogPost.order(created_at: :desc)
  end
end
