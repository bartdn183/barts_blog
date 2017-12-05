class BlogPostsController < ApplicationController
  before_action :set_blog_post, only: [:show, :edit, :update, :destroy]
  before_action :all_blog_posts, only: [:index, :create, :update, :destroy]
  before_action :all_categories, only: [:new, :edit]
  before_action :all_comments, only: [:show]
  before_action :authenticate_user!
  before_action :unauthorized_user!

  def index
    @blog_posts = BlogPost.all
  end

  def show
    @comment = Comment.new
    # @comments = Comment.where(blog_post_id: @comment.blog_post_id)
  end

  # GET /blog_posts/new
  def new
    @blog_post = BlogPost.new
  end

  # GET /blog_posts/1/edit
  def edit
  end

  # POST /blog_posts
  # POST /blog_posts.json
  def create
    @blog_post = BlogPost.create(blog_post_params)
  end

  # PATCH/PUT /blog_posts/1
  # PATCH/PUT /blog_posts/1.json
  def update
    @blog_post.update(blog_post_params)
  end

  # DELETE /blog_posts/1
  # DELETE /blog_posts/1.json
  def destroy
    @blog_post.destroy
  end

  private

    def all_comments
      @comments = Comment.where(blog_post_id: @blog_post.id).order(created_at: :desc)
    end

    def all_blog_posts
      @blog_posts = BlogPost.all
    end

    def all_categories
      @categories = Category.all
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_blog_post
      @blog_post = BlogPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_post_params
      params.require(:blog_post).permit(:title, :entry, :category_id, :sub_category_id, :user_id)
    end
end
