class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_by_post, only: %i[create show edit update destroy]

  include Pagy::Backend

  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  def index
    @posts = if params[:user_id] == current_user.id
               User.find(params[:id]).posts
             else
               Post.published
             end
    @pagy, @posts = pagy(@posts.reorder('created_at DESC'), page: params[:page], items: 4)
  end

  def show
    find_post
    @src = URI.extract(@post.post_content)[0]
    post_content
    @new_comment = Comment.build_from(@post, current_user.id, '')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    respond_to do |format|
      if @post.save
        format.html { redirect_to user_posts_path, notice: 'Post was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    find_post
  end

  def update
    find_post
    if @post.user_id == current_user.id
      @post.update(post_params)
      redirect_to :user_posts, info: 'Post Updated'
    else
      redirect_to :user_posts, error: 'Invalid Post Owner'
    end
  end

  def destroy
    find_post
    if @post.user_id == current_user.id
      @post.destroy
      redirect_to :user_posts, info: 'Post Deleted'
    else
      redirect_to :user_posts, error: 'Not Authorized!'
    end
  end

  def render_404
    redirect_to :user_posts, error: 'Not Available'
  end


  private

  def post_publish 
    if @post.published == false && @post.user_id != current_user.id
      redirect_to :user_posts, warning: 'Post Not Published'
    elsif @post.published == false && @post.user_id == current_user.id
      redirect_to :edit_user_post, info: 'Enable Publish to Public Posts'
    end
  end

  def post_content 
    if @post.post_content =~ URI::DEFAULT_PARSER.make_regexp
      object = LinkThumbnailer.generate(@post.post_content)
      @title = object.title
    else
      @post
    end
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def set_by_post
    @post = Post.find_by(params[:id])
  end

  def post_params
    params.require(:post).permit(:post_content, :published)
  end
end
